# coding: utf-8

class Smallbattlecreator

  def self.create_by_id(turn_id, src_squad_id, tgt_squad_id)
    create(Smalltrialturn.find(turn_id), Smallmobsquad.find(src_squad_id), Smallmobsquad.find(tgt_squad_id))
  end

  def self.create(turn, src_squad, tgt_squad)

    src_mobs = src_squad.smallmobs
    tgt_mobs = tgt_squad.smallmobs

    # Set defender flag
    src_mobs.each do |mob|
      mob.is_defender = false
      mob.friends = src_mobs
      mob.enemies = tgt_mobs
    end
    tgt_mobs.each do |mob|
      mob.is_defender = true
      mob.friends = tgt_mobs
      mob.enemies = src_mobs
    end

    # Settle initiative
    all_mobs = src_mobs + tgt_mobs

    sorted_all_mobs = all_mobs.sort{|a,b|
      a.agi_roll <=> b.agi_roll
    }

    # Calculate attack act_interval
    lcm_of_agi = 1
    sorted_all_mobs.each do |mob|
      lcm_of_agi = mob.smallmobinfo.agi.lcm(lcm_of_agi)
    end

    # Set attack act_interval
    sorted_all_mobs.each do |mob|
      mob.act_interval = lcm_of_agi / mob.smallmobinfo.agi
    end

    # Proceed battle phase
    phase = 0
    until src_squad.annihilated? or tgt_squad.annihilated?
      p "phase:" + phase.to_s
      sorted_all_mobs.each do |mob|
        if phase == 0 or phase % mob.act_interval == 0
          if mob.healer? and mob.mp > 0 and heal_needed?(mob.friends)
            heal(turn, mob, mob.friends)
          else
            attack(turn, mob, mob.enemies)
          end
        end
      end
      sorted_all_mobs.each do |mob|
        p mob.name + ":" + mob.max_hp.to_s + "/" + mob.hp.to_s
      end
      phase += 1
    end

    src_squad.save
    tgt_squad.save
    turn.save
  end

  private

  def self.attack(turn, src_mob, tgt_mobs)
    tgt_mob = tgt_mobs[rand(tgt_mobs.length)]
    src_mob_info = src_mob.smallmobinfo
    tgt_mob_info = tgt_mob.smallmobinfo

    damage_type = "物理"
    damage_to_tgt = 0
    if src_mob.wizard? and src_mob.mp > 0
      damage_to_tgt = magic_attack
      src_mob.mp -= src_mob.smallmobinfo.smallmagicinfos[0].mp_cost
      src_mob.mp = 0 if src_mob.mp < 0
      damage_type = "魔法"
    else
      atk_damage = rand(src_mob_info.high_atk - src_mob_info.low_atk) + src_mob_info.low_atk
      wepon_damage = rand(src_mob.smallweponinfos[0].atk)
      damage_to_tgt = atk_damage + wepon_damage - tgt_mob_info.def - tgt_mob.smallarmorinfos[0].def
      damage_to_tgt = 1 if damage_to_tgt < 1
    end

    is_critical_hit = false
    is_critical_hit = true if (rand(20) + 1) == 20
    damage_to_tgt += damage_to_tgt if is_critical_hit

    tgt_mob.hp -= damage_to_tgt
    tgt_mob.hp = 0 if tgt_mob.hp < 0

    log = src_mob.name + "が" + tgt_mob.name + "に"
    log += damage_to_tgt.to_s + "の" + damage_type + "ダメージ。\n"
    log += "クリティカルヒット！\n" if is_critical_hit
    log += tgt_mob.name + "は死んだ。\n" if tgt_mob.hp == 0
    p log

    battle = Smallturnbattlelog.new
    battle.smalltrialturn_id = turn.id
    battle.src_mob_id = src_mob.id
    battle.tgt_mob_id = tgt_mob.id
    battle.damage = damage_to_tgt
    battle.log = log
    battle.save
    turn.smallturnbattlelogs << battle
  end

  def self.magic_attack
    return rand(4) + 1
  end

  def self.heal(turn, src_mob, tgt_mobs)
    wounded_mobs = Array.new
    tgt_mobs.each do |mob|
      wounded_mobs << mob if mob.hp < mob.max_hp
    end
    tgt_mob = wounded_mobs[rand(wounded_mobs.length)]
    heal_to_tgt = rand(3) + 1
    tgt_mob.hp += heal_to_tgt
    tgt_mob.hp = tgt_mob.max_hp if tgt_mob.hp = tgt_mob.max_hp
    src_mob.mp -= src_mob.smallmobinfo.smallmagicinfos[0].mp_cost
    src_mob.mp = 0 if src_mob.mp < 0

    log = src_mob.name + "が" + tgt_mob.name + "に" + heal_to_tgt.to_s + "のヒール。\n"
    p log

    battle = Smallturnbattlelog.new
    battle.smalltrialturn_id = turn.id
    battle.src_mob_id = src_mob.id
    battle.tgt_mob_id = tgt_mob.id
    battle.heal = heal_to_tgt
    battle.log = log
    battle.save
    turn.smallturnbattlelogs << battle
  end

  def self.heal_needed?(mobs)
    mobs.each do |mob|
      return true if mob.hp < mob.max_hp
    end
    return false
  end
end


