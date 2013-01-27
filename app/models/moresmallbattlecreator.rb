# coding: utf-8

class Moresmallbattlecreator

  END_LINE = 5
  START_LINE = 1
  AVG_ABILITY = 50

  def self.create_by_id(trial_turn_id, src_squad_id, tgt_squad_id)
    create(Moresmalltrialturn.find(trial_turn_id), Moresmallmobsquad.find(src_squad_id), Moresmallmobsquad.find(tgt_squad_id))
  end

  def self.create(trial_turn, src_squad, tgt_squad)
    src_mobs = src_squad.moresmallmobs
    tgt_mobs = tgt_squad.moresmallmobs

    # Set attacker flag and vpos.
    src_mobs.each do |mob|
      mob.is_defender = false
      mob.friends = src_mobs
      mob.enemies = tgt_mobs
      if mob.healer? or mob.wizard?
        mob.vpos = START_LINE
      else
        mob.vpos = START_LINE + 1
      end
    end

    # Set defender flag and vpos.
    tgt_mobs.each do |mob|
      mob.is_defender = true
      mob.friends = tgt_mobs
      mob.enemies = src_mobs
      if mob.healer? or mob.wizard?
        mob.vpos = END_LINE
      else
        mob.vpos = END_LINE - 1
      end
    end

    # Settle initiative
    all_mobs = src_mobs + tgt_mobs

    sorted_all_mobs = all_mobs.sort{|a,b|
      a.dex_roll <=> b.dex_roll
    }

    # Calculate attack act_interval.
    lcm_of_dex = 1
    sorted_all_mobs.each do |mob|
      lcm_of_dex = mob.moresmallmobinfo.dex.lcm(lcm_of_dex)
    end

    # Set attack act_interval.
    sorted_all_mobs.each do |mob|
      mob.act_interval = lcm_of_dex / mob.moresmallmobinfo.dex
    end

    # Proceed battle turn.
    battle_turn_count = 0
    until src_squad.annihilated? or tgt_squad.annihilated?
      battle_turn = Moresmallbattleturn.new
      battle_turn.moresmalltrialturn_id = trial_turn.id
      battle_turn.src_squad_id = src_squad.id
      battle_turn.tgt_squad_id = tgt_squad.id
      sorted_all_mobs.each do |mob|
        unless mob.dead?
          if battle_turn_count == 0
            battle_log = Moresmallbattlelog.new
            battle_log.moresmallbattleturn_id = battle_turn.id
            battle_log.src_mob_id = mob.id
            battle_log.src_mob_vpos = mob.vpos
            battle_log.save
            battle_turn.moresmallbattlelogs << battle_log
          elsif battle_turn_count == 1 or battle_turn_count % mob.act_interval == 0
            p "Battle turn:" + battle_turn_count.to_s
            p mob.name + " HP:" + mob.max_hp.to_s + "/" + mob.hp.to_s + " MP:" + mob.max_mp.to_s + "/" + mob.mp.to_s
            damage_over_turn(battle_turn, mob) if mob.has_DoT?
            heal_over_turn(battle_turn, mob) if mob.has_HoT?
            mob.move
            p mob.name + "のvpos:" + mob.vpos.to_s
            if mob.healer?
              if mob.can_heal?
                heal(battle_turn, mob, mob.friends)
              elsif mob.can_physical_attack?
                physical_attack(battle_turn, mob, mob.enemies)
              end
            elsif mob.wizard?
              if mob.can_magical_attack?
                magical_attack(battle_turn, mob, mob.enemies)
              elsif mob.can_physical_attack?
                physical_attack(battle_turn, mob, mob.enemies)
              end
            else
              if mob.can_physical_attack?
                physical_attack(battle_turn, mob, mob.enemies)
              end
            end
          end
        end
      end
      battle_turn_count += 1
      trial_turn.moresmallbattleturns << battle_turn unless battle_turn.moresmallbattlelogs.blank?
    end
    src_squad.save
    tgt_squad.save
    trial_turn.save
  end

  private

  def self.magical_attack(battle_turn, src_mob, tgt_mobs)
    log = ""
    src_mob.mp -= src_mob.magicinfos.first.mp_cost
    src_mob.mp = 0 if src_mob.mp < 0
    tgt_mob = tgt_mobs[rand(tgt_mobs.size)]
    hit_rate = calc_hit_rate(src_mob.magicinfos.first.accuracy, src_mob.int)
    if hit_rate > rand(100) + 1
      damage = calc_magical_damage(src_mob.magicinfos.first.inst_dmg, src_mob.int)
      tgt_mob.hp -= damage
      tgt_mob.hp = 0 if tgt_mob.hp < 0
      log = DD_log(src_mob, tgt_mob, damage, true)
      if not tgt_mob.dead? and src_mob.magicinfos.first.category_id == 2
        log += DoT_got_log(tgt_mob, src_mob.magicinfos.first, true)
        effect = Moresmallmobeffect.new
        effect.moresmallmob_id = tgt_mob.id
        effect.moresmallmagicinfo_id = src_mob.magicinfos.first.id
        effect.duration = src_mob.magicinfos.first.duration
        tgt_mob.moresmallmobeffects << effect
      end
    else
      log = DD_log(src_mob, tgt_mob, 0, true)
    end
    battle_log = Moresmallbattlelog.new
    battle_log.moresmallbattleturn_id = battle_turn.id
    battle_log.src_mob_id = src_mob.id
    battle_log.src_mob_vpos = src_mob.vpos
    battle_log.tgt_mob_id = tgt_mob.id
    battle_log.tgt_mob_vpos = tgt_mob.vpos
    battle_log.tgt_mob_dead = false
    battle_log.tgt_mob_dead = true if tgt_mob.dead?
    battle_log.damage = damage
    battle_log.log = log
    p log

    src_mob.save
    tgt_mob.save
    battle_log.save
    battle_turn.moresmallbattlelogs << battle_log
  end

  def self.physical_attack(battle_turn, src_mob, tgt_mobs)
    log = ""
    tgt_mob = tgt_mobs[rand(tgt_mobs.size)]
    hit_rate = calc_hit_rate(src_mob.weponinfos.first.accuracy, src_mob.dex)
    if hit_rate > rand(100) + 1
      damage = calc_physical_damage(src_mob.weponinfos.first.atk, src_mob.str, tgt_mob.armorinfos.first.def)
      tgt_mob.hp -= damage
      tgt_mob.hp = 0 if tgt_mob.hp < 0
      log = DD_log(src_mob, tgt_mob, damage, false)
    else
      log = DD_log(src_mob, tgt_mob, 0, false)
    end
    battle_log = Moresmallbattlelog.new
    battle_log.moresmallbattleturn_id = battle_turn.id
    battle_log.src_mob_id = src_mob.id
    battle_log.src_mob_vpos = src_mob.vpos
    battle_log.tgt_mob_id = tgt_mob.id
    battle_log.tgt_mob_vpos = tgt_mob.vpos
    battle_log.tgt_mob_dead = false
    battle_log.tgt_mob_dead = true if tgt_mob.dead?
    battle_log.damage = damage
    battle_log.log = log
    p log

    src_mob.save
    tgt_mob.save
    battle_log.save
    battle_turn.moresmallbattlelogs << battle_log
  end

  def self.damage_over_turn(battle_turn, tgt_mob)
    tgt_mob.moresmallmobeffects.each do |effect|
      if effect.moresmallmagicinfo.category_id == 2
        damage = calc_magical_damage(effect.avg_DoT_dmg, AVG_ABILITY)
        tgt_mob.hp -= damage
        tgt_mob.hp = 0 if tgt_mob.hp < 0
        effect.duration -= 1
        tgt_mob.moresmallmobeffects.delete(effect) if effect.duration == 0
        log = DoT_log(tgt_mob, effect.moresmallmagicinfo, damage, true)
        battle_log = Moresmallbattlelog.new
        battle_log.moresmallbattleturn_id = battle_turn.id
        battle_log.tgt_mob_id = tgt_mob.id
        battle_log.tgt_mob_vpos = tgt_mob.vpos
        battle_log.tgt_mob_dead = false
        battle_log.tgt_mob_dead = true if tgt_mob.dead?
        battle_log.damage = damage
        battle_log.log = log
        p log

        tgt_mob.save
        battle_log.save
        battle_turn.moresmallbattlelogs << battle_log
      end
    end
  end

  def self.heal(battle_turn, src_mob, tgt_mobs)
    log = ""
    src_mob.mp -= src_mob.magicinfos.first.mp_cost
    src_mob.mp = 0 if src_mob.mp < 0
    wounded_mobs = Array.new
    tgt_mobs.each do |mob|
      wounded_mobs << mob if mob.hp < mob.max_hp and not mob.dead?
    end
    tgt_mob = wounded_mobs[rand(wounded_mobs.length)]
    hit_rate = calc_hit_rate(src_mob.magicinfos.first.accuracy, src_mob.wis)
    if hit_rate > rand(100) + 1
      heal = calc_heal(src_mob.magicinfos.first.inst_heal, src_mob.wis)
      tgt_mob.hp += heal
      tgt_mob.hp = tgt_mob.max_hp if tgt_mob.max_hp < tgt_mob.hp
      log = DH_log(src_mob, tgt_mob, heal)
      if src_mob.magicinfos.first.category_id == 102
        log += HoT_got_log(tgt_mob, src_mob.magicinfos.first)
        effect = Moresmallmobeffect.new
        effect.moresmallmob_id = tgt_mob.id
        effect.moresmallmagicinfo_id = src_mob.magicinfos.first.id
        effect.duration = src_mob.magicinfos.first.duration
        tgt_mob.moresmallmobeffects << effect
      end
    else
      log = DH_log(src_mob, tgt_mob, 0)
    end
    battle_log = Moresmallbattlelog.new
    battle_log.moresmallbattleturn_id = battle_turn.id
    battle_log.src_mob_id = src_mob.id
    battle_log.src_mob_vpos = src_mob.vpos
    battle_log.tgt_mob_id = tgt_mob.id
    battle_log.tgt_mob_vpos = tgt_mob.vpos
    battle_log.heal = heal
    battle_log.log = log
    p log

    src_mob.save
    tgt_mob.save
    battle_log.save
    battle_turn.moresmallbattlelogs << battle_log
  end

  def self.heal_over_turn(battle_turn, tgt_mob)
    tgt_mob.moresmallmobeffects.each do |effect|
      if effect.moresmallmagicinfo.category_id == 102
        heal = calc_heal(effect.avg_HoT_heal, AVG_ABILITY)
        tgt_mob.hp += heal
        tgt_mob.hp = tgt_mob.max_hp if tgt_mob.max_hp < tgt_mob.hp
        effect.duration -= 1
        tgt_mob.moresmallmobeffects.delete(effect) if effect.duration == 0
        log = HoT_log(tgt_mob, effect.moresmallmagicinfo, heal)
        battle_log = Moresmallbattlelog.new
        battle_log.moresmallbattleturn_id = battle_turn.id
        battle_log.tgt_mob_id = tgt_mob.id
        battle_log.tgt_mob_vpos = tgt_mob.vpos
        battle_log.heal = heal
        battle_log.log = log
        p log

        tgt_mob.save
        battle_log.save
        battle_turn.moresmallbattlelogs << battle_log
      end
    end
  end

  def self.heal_needed?(mobs)
    mobs.each do |mob|
      return true if mob.hp < mob.max_hp
    end
    return false
  end

  def self.calc_hit_rate(accuracy, ability)
    rate = accuracy + (0.4 * (ability - 50))
    if rate < 1
      rate = 1
    elsif 99 < rate
      rate = 99
    end
    return rate
  end

  def self.calc_magical_damage(base_dmg, ability)
    return (gaussian_rand(base_dmg) * (1 + (0.4 * (ability - 50) / 100))).round + 1
  end

  def self.calc_physical_damage(base_atk, ability, base_def)
    calced_atk = (gaussian_rand(base_atk) * (1 + (0.4 * (ability - 50) / 100))).round + 1
    calced_def = (gaussian_rand(base_def)).round + 1
    damage = calced_atk - calced_def
    damage = 1 if damage == 0
    return damage
  end

  def self.calc_heal(base_heal, ability)
    return (gaussian_rand(base_heal) * (1 + (0.4 * (ability - 50) / 100))).round + 1
  end

  def self.DD_log(src_mob, tgt_mob, damage, is_magic)
    damage_type = "物理"
    damage_type = "魔法" if is_magic
    log = src_mob.name + "が" + tgt_mob.name + "に"
    if 0 < damage
      log += damage.to_s + "の" + damage_type + "ダメージ。\n"
      log += tgt_mob.name + "は死んだ。\n" if tgt_mob.dead?
    else
      log += damage_type + "攻撃失敗。\n"
    end
    return log
  end

  def self.DoT_log(tgt_mob, effectinfo, damage, is_magic)
    damage_type = "物理"
    damage_type = "魔法" if is_magic
    log = tgt_mob.name + "は" + effectinfo.name + "による"
    log += damage.to_s + "の" + damage_type + "ダメージ。\n"
    log += tgt_mob.name + "は死んだ。\n" if tgt_mob.dead?
    return log
  end

  def self.DoT_got_log(tgt_mob, effectinfo, is_magic)
    damage_type = "物理"
    damage_type = "魔法" if is_magic
    log = tgt_mob.name + "は" + effectinfo.name + "を受けた。"
    return log
  end

  def self.DH_log(src_mob, tgt_mob, heal)
    log = src_mob.name + "が" + tgt_mob.name + "に"
    if 0 < heal
      log += heal.to_s + "のヒール。\n"
    else
      log += "ヒール失敗。\n"
    end
    return log
  end

  def self.HoT_log(tgt_mob, effectinfo, heal)
    log = tgt_mob.name + "は" + effectinfo.name + "による"
    log += heal.to_s + "のヒール。\n"
    return log
  end

  def self.HoT_got_log(tgt_mob, effectinfo)
    log = tgt_mob.name + "は" + effectinfo.name + "を受けた。"
    return log
  end

  def self.gaussian_rand(max)
    sum = 0.0
    (max * 2).times do
      sum += rand()
    end
    return sum.ceil
  end
end


