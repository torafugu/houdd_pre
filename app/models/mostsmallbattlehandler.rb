# coding: utf-8

class Mostsmallbattlehandler
  def self.execute_by_id(battleset_id)
    execute(Mostsmallbattleset.find(battleset_id))
  end

  def self.execute(battleset)
    first_battle_turn = Mostsmallbattleturn.new
    first_battle_turn.mostsmallbattleset_id = battleset.id
    first_battle_turn.save

    #set-up phase
    atk_mobs = battleset.atk_squad.mostsmallmobs
    def_mobs = battleset.def_squad.mostsmallmobs
    atk_mobs.each do |mob|
      mob.friends = atk_mobs
      mob.enemies = def_mobs
      mob.is_defender = false
      if mob.healer? or mob.wizard?
        mob.vpos = Mostsmallparams::START_LINE
      else
        mob.vpos = Mostsmallparams::START_LINE + 1
      end
    end
    def_mobs.each do |mob|
      mob.friends = def_mobs
      mob.enemies = atk_mobs
      mob.is_defender = true
      if mob.healer? or mob.wizard?
        mob.vpos = Mostsmallparams::END_LINE
      else
        mob.vpos = Mostsmallparams::END_LINE - 1
      end
    end

    sorted_by_dex_mobs = Tools.sort_by_dex(atk_mobs + def_mobs)

    # Buff phase
    sorted_by_dex_mobs.each do |mob|
      # Set default hate
      if mob.warrior?
        mob.hate = Mostsmallparams::WARRIOR_INITIAL_HATE
      else
        mob.hate = 0
      end
      create_effect_log(first_battle_turn, mob, nil, nil)
      buff_skill = mob.status_up_skill
      next unless buff_skill
      is_buff_skill_casted = false
      mob.mostsmallbattleeffectinventories.each do |battle_effect_inventory|
        if battle_effect_inventory.mostsmalleffect.id == buff_skill.effect.id
          is_buff_skill_casted = true
          break
        end
      end
      next if is_buff_skill_casted
      battle_effect = Mostsmallbattleeffectinventory.new
      battle_effect.mostsmallmob_id = mob.id
      battle_effect.src_mob_id = mob.id
      battle_effect.mostsmalleffect_id = buff_skill.effect.id
      battle_effect.remaining_duration = buff_skill.effect.duration
      mob.sp -= buff_skill.sp
      mob.sp = 0 if mob.sp < 0
      mob.mostsmallbattleeffectinventories << battle_effect
      create_effect_log(first_battle_turn, mob, mob, buff_skill.effect.id)
    end
    battleset.mostsmallbattleturns << first_battle_turn

    # Battle phase
    is_battle_over = false
    until is_battle_over
      battle_turn = Mostsmallbattleturn.new
      battle_turn.mostsmallbattleset_id = battleset.id
      battle_turn.save

      sorted_by_dex_mobs.each do |mob|
        next if mob.dead?
        # DoT / HoT execution phase
        mob.mostsmallbattleeffectinventories.each do |battle_effect_inventory|
          if 0 < battle_effect_inventory.mostsmalleffect.damage and 0 < battle_effect_inventory.remaining_duration
            damage = calc_damage(battle_effect_inventory.mostsmalleffect.damage, mob.ac, battle_effect_inventory.src_mob.int)
            mob.hp -= damage
            mob.hp = 0 if mob.hp < 0
            battle_effect_inventory.src_mob.battle_exp += damage
            create_attack_log(battle_turn, battle_effect_inventory.src_mob, mob, battle_effect_inventory.mostsmalleffect, damage)
          elsif battle_effect_inventory.mostsmalleffect.damage < 0 and 0 < battle_effect_inventory.remaining_duration
            heal = calc_damage(battle_effect_inventory.mostsmalleffect.damage.abs, 1, 1) # No damage adjustment
            mob.hp += heal
            mob.hp = mob.max_hp if mob.max_hp < mob.hp
            battle_effect_inventory.src_mob.battle_exp += heal
            create_attack_log(battle_turn, battle_effect_inventory.src_mob, mob, battle_effect_inventory.mostsmalleffect, -heal)
          end
          battle_effect_inventory.remaining_duration -= 1 
        end
        mob.mostsmallbattleeffectinventories.delete_if {|inventory| inventory.remaining_duration <= 0}

        # Action phase
        if mob.act?
          mob.vpos_move
          if mob.healer?
            if not mob.heal_skills_in_range.blank?
              skill_heal(battle_turn, mob)
            elsif not mob.wepons_in_range.blank?
              physical_attack(battle_turn, mob)
            end
          else
            if not mob.attack_skills_in_range.blank?
              skill_attack(battle_turn, mob)
            elsif not mob.wepons_in_range.blank?
              physical_attack(battle_turn, mob)
            end
          end
        end
      end
      if battleset.atk_squad.annihilated?
        battle_turn.log = "攻撃側全滅(" + battleset.atk_squad.name + ")。"
      elsif battleset.def_squad.annihilated?
        battle_turn.log = "防御側全滅(" + battleset.def_squad.name + ")。"
      elsif battleset.atk_squad.retreated?
        battle_turn.log = "攻撃側撤退。"
      elsif battleset.def_squad.retreated?
        battle_turn.log = "防御側撤退。"
      end
      battle_turn.save
      battleset.mostsmallbattleturns << battle_turn
      p battle_turn.log if battle_turn.log
      is_battle_over = true if battle_turn.log
    end
    sorted_by_dex_mobs.each do |mob|
      mob.mostsmallbattleeffectinventories.clear
      mob.save
    end
  end

  private

  def self.skill_heal(battle_turn, mob)
    skill = mob.heal_skills_in_range[rand(mob.heal_skills_in_range.length)]
    skill.target_mobs.each do |target_mob|
      if hit?(skill.accuracy, 1, 1) # No hit adjustment
        heal = calc_damage(skill.damage.abs, 1, 1) # No damage adjustment
        target_mob.hp += heal
        target_mob.hp = target_mob.max_hp if target_mob.max_hp < target_mob.hp
        mob.hate += heal
        mob.battle_exp += heal
        mob.sp -= skill.sp
        mob.sp = 0 if mob.sp < 0
        create_attack_log(battle_turn, mob, target_mob, skill, -heal)
        add_battle_effect(target_mob, mob, skill.effect) if skill.effect
      end
    end
  end

  def self.skill_attack(battle_turn, mob)
    skill = mob.attack_skills_in_range[rand(mob.attack_skills_in_range.length)]
    skill.target_mobs.each do |target_mob|
      if hit?(skill.accuracy, target_mob.int, mob.int)
        damage = calc_damage(skill.damage, target_mob.ac, mob.int)
        target_mob.hp -= damage
        target_mob.hp = 0 if target_mob.hp < 0
        mob.hate += damage
        mob.battle_exp += damage
        mob.sp -= skill.sp
        mob.sp = 0 if mob.sp < 0
        create_attack_log(battle_turn, mob, target_mob, skill, damage)
        add_battle_effect(target_mob, mob, skill.effect) if skill.effect
      end
    end
  end

  def self.physical_attack(battle_turn, mob)
    mob.wepons_in_range.each do |wepon|
      wepon.target_mobs.each do |target_mob|
        if hit?(wepon.accuracy, target_mob.dex, mob.dex)
          damage = calc_damage(wepon.damage, target_mob.ac, mob.str)
          damage = 0 if target_mob.mostsmallmobgene.mostsmallmobspecie_id == Mostsmallparams::DRAGON_SPECIE_ID and 2 < rand(4)
          target_mob.hp -= damage
          target_mob.hp = 0 if target_mob.hp < 0
          mob.hate += damage
          mob.battle_exp += damage
          create_attack_log(battle_turn, mob, target_mob, wepon, damage)
          add_battle_effect(target_mob, mob, wepon.effect) if wepon.effect
        end
        # counter_attack!!!
        if Mostsmallparams::COUNTER_JOB_IDS.index(target_mob.mostsmalljob_id) and 0 < rand(2) and not target_mob.wepons_in_range.blank?
          physical_attack(battle_turn, target_mob)
        end
      end
    end
  end

  def self.add_battle_effect(target_mob, mob, effect)
    mob.hate += effect.damage.abs * effect.duration
    battle_effect = Mostsmallbattleeffectinventory.new
    battle_effect.mostsmallmob_id = target_mob.id
    battle_effect.src_mob_id = mob.id
    battle_effect.mostsmalleffect_id = effect.id
    battle_effect.remaining_duration = effect.duration
    target_mob.mostsmallbattleeffectinventories << battle_effect
  end

  def self.hit?(accuracy, target_mod, self_mod)
    #p "target_mod:" + target_mod.to_s
    #p "self_mod:" + self_mod.to_s
    hit_adjust = Mostsmallparams::HIT_ADJUST_MAX * (target_mod - self_mod) / self_mod
    hit_adjust = Tools.filter_in_range(Mostsmallparams::HIT_ADJUST_MAX, hit_adjust)
    hit_rate = Tools.filter_percent(accuracy - (accuracy * hit_adjust))
    #p "hit_adjust:" + hit_adjust.to_s
    #p "hit_rate:" + hit_rate.to_s
    return rand(10000) <= hit_rate.round(2) * 100
  end

  def self.calc_damage(damage, target_mod, self_mod)
    #p "target_mod:" + target_mod.to_s
    #p "self_mod:" + self_mod.to_s
    damage_adjust = Mostsmallparams::DAMAGE_ADJUST_MAX * (target_mod - (damage + self_mod * Mostsmallparams::DAMAGE_AMPLIFIER)) / (damage + self_mod * Mostsmallparams::DAMAGE_AMPLIFIER)
    damage_adjust = Tools.filter_in_range(Mostsmallparams::DAMAGE_ADJUST_MAX, damage_adjust)
    damage_rate = damage * (1 - damage_adjust)
    damage = Tools.gaussian_rand(damage_rate, damage_rate * Mostsmallparams::DAMAGE_SD).round
    damage = 1 if damage == 0
    #p "damage_adjust:" + damage_adjust.to_s
    #p "damage:" + damage.to_s
    return damage
  end

  def self.create_attack_log(battle_turn, mob, target_mob, atk_info, damage)
    p mob.name + " vpos:" + mob.vpos.to_s + " HP:" + mob.max_hp.to_s + "/" + mob.hp.to_s + " SP:" + mob.max_sp.to_s + "/" + mob.sp.to_s + " " + atk_info.name + "によるダメージ:" + damage.to_s + "→" + target_mob.name + " vpos:" + target_mob.vpos.to_s + " HP:" + target_mob.max_hp.to_s + "/" + target_mob.hp.to_s
    battle_log = Mostsmallbattlelog.new
    battle_log.mostsmallbattleturn_id = battle_turn.id
    battle_log.atk_mob_id = mob.id
    battle_log.atk_mob_vpos = mob.vpos
    battle_log.def_mob_id = target_mob.id
    battle_log.def_mob_vpos = target_mob.vpos
    if target_mob.dead?
      battle_log.is_def_mob_dead = true
    else
      battle_log.is_def_mob_dead = false
    end
    battle_log.damage_cause = atk_info.name
    battle_log.damage = damage
    battle_log.save
    battle_turn.mostsmallbattlelogs << battle_log
  end

  def self.create_effect_log(battle_turn, mob, target_mob, effect_id)
    if not effect_id.nil? and not target_mob.nil?
      p mob.name + " vpos:" + mob.vpos.to_s + " HP:" + mob.max_hp.to_s + "/" + mob.hp.to_s + " SP:" + mob.max_sp.to_s + "/" + mob.sp.to_s + " " + "持続効果:" + effect_id.to_s + "→" + target_mob.name + " vpos:" + target_mob.vpos.to_s + " HP:" + target_mob.max_hp.to_s + "/" + target_mob.hp.to_s
    end
    battle_log = Mostsmallbattlelog.new
    battle_log.mostsmallbattleturn_id = battle_turn.id
    battle_log.atk_mob_id = mob.id
    battle_log.atk_mob_vpos = mob.vpos
    battle_log.def_mob_id = target_mob.id unless target_mob.nil?
    battle_log.def_mob_vpos = target_mob.vpos unless target_mob.nil?
    battle_log.is_def_mob_dead = false
    battle_log.effect_id = effect_id
    battle_log.save
    battle_turn.mostsmallbattlelogs << battle_log
  end
end
