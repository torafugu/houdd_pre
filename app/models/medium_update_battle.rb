# coding: utf-8

class MediumUpdateBattle
  # def self.execute_by_id(first_atk_mission_id, second_atk_mission_id, first_atk_squad_id, second_atk_squad_id, distance)
  #   first_atk_squad = MediumSquad.find(first_atk_squad_id)
  #   second_atk_squad = MediumSquad.find(second_atk_squad_id)

  #   first_atk_mission = MediumMission.find(first_atk_mission_id)
  #   second_atk_mission = MediumMission.find(second_atk_mission_id)

  #   first_atk_squad.medium_mobs.each do |mob|
  #     mob.strategy = first_atk_mission.strategy.jobs[mob.medium_job_id]
  #   end

  #   second_atk_squad.medium_mobs.each do |mob|
  #     mob.strategy = second_atk_mission.strategy.jobs[mob.medium_job_id]
  #   end

  #   execute(MediumTrialTurn.last, first_atk_squad, second_atk_squad, distance)
  # end

  def self.execute(turn, battle_set_index, first_atk_squad, second_atk_squad, distance)
    # first_atk_squad.id.to_s + "," + second_atk_squad.id.to_s + "," + distance.to_s
    # first_battle_turn = MediumBattleTurn.new
    # first_battle_turn.medium_trial_turn_id = turn.id
    # first_battle_turn.battle_set_index = battle_set_index
    # first_battle_turn.atk_trial_squad_id = turn.medium_trial.convert_to_trial_squad_id(first_atk_squad.id)
    # first_battle_turn.def_trial_squad_id = turn.medium_trial.convert_to_trial_squad_id(second_atk_squad.id)
    # first_battle_turn.save
    # turn.medium_battle_turns << first_battle_turn

    # Set-up phase
    first_atk_mobs = first_atk_squad.medium_mobs
    second_atk_mobs = second_atk_squad.medium_mobs
    first_atk_mobs.each do |mob|
      mob.divide_to_first_atk
      mob.friends = first_atk_squad.medium_mobs
      mob.enemies = second_atk_squad.medium_mobs
      mob.hate = 0
      if mob.medium_job.healer? or mob.medium_job.wizard?
        mob.vpos = Consts::BATTLE_START_LINE
      else
        mob.vpos = Consts::BATTLE_START_LINE + 1
      end
    end
    second_atk_mobs.each do |mob|
      mob.divide_to_second_atk
      mob.friends = second_atk_squad.medium_mobs
      mob.enemies = first_atk_squad.medium_mobs
      mob.hate = 0
      if mob.medium_job.healer? or mob.medium_job.wizard?
        mob.vpos = Consts::BATTLE_END_LINE
      else
        mob.vpos = Consts::BATTLE_END_LINE - 1
      end
    end

    sorted_by_dex_mobs = Tools.sort_by_dex(first_atk_mobs + second_atk_mobs)

    # Battle phase
    first_battle_turn_flag = true
    battle_end_flag = false
    battle_loop_index = 0
    until battle_end_flag
      battle_turn = MediumBattleTurn.new
      battle_turn.medium_trial_turn_id = turn.id
      battle_turn.battle_set_index = battle_set_index
      battle_turn.atk_trial_squad_id = turn.medium_trial.convert_to_trial_squad_id(first_atk_squad.id)
      battle_turn.def_trial_squad_id = turn.medium_trial.convert_to_trial_squad_id(second_atk_squad.id)
      battle_turn.save
      turn.medium_battle_turns << battle_turn

      (first_atk_mobs + second_atk_mobs).each do |mob|
        next if mob.dead? or mob.retreated?

        # Buff phase
        if first_battle_turn_flag
          add_battle_log(battle_turn, mob.id, mob.vpos, mob.vpos, nil, false, nil, 0)
          casted_buff = mob.cast_buff
          casted_buff_name = nil
          casted_buff_name = casted_buff.name unless casted_buff.blank?
          add_battle_log(battle_turn, mob.id, mob.vpos, mob.vpos, mob.id, false, casted_buff_name, 0)
        end

        # DoT / HoT execution phase
        mob.medium_battle_effect_invs.each do |battle_effect_inv|
          next if 0 >= battle_effect_inv.rmng_duration
          next if battle_effect_inv.medium_status_mod.blank?
          next if battle_effect_inv.medium_status_mod.hp_mod == 0
          hp_mod = calc_damage(battle_effect_inv.medium_status_mod.hp_mod, battle_effect_inv.caused_mob.int, mob.full_skill_def)
          hp_mod = -1 * calc_damage(battle_effect_inv.medium_status_mod.hp_mod.abs, battle_effect_inv.caused_mob.int, mob.full_skill_def) if battle_effect_inv.medium_status_mod.hp_mod < 0
          mob.update_hp(hp_mod)
          battle_effect_inv.caused_mob.exp += hp_mod.abs
          battle_effect_inv.caused_mob.hate += hp_mod.abs unless battle_effect_inv.caused_mob.hate.nil?
          add_battle_log(battle_turn, battle_effect_inv.caused_mob.id, battle_effect_inv.caused_mob.vpos, battle_effect_inv.caused_mob.vpos, mob.id, mob.dead?, battle_effect_inv.medium_status_mod.name, hp_mod)
          battle_effect_inv.rmng_duration -= 1
        end
        mob.medium_battle_effect_invs.delete_if {|battle_effect_inv| battle_effect_inv.rmng_duration <= 0}
      end

      mob_actioned_flag = false
      action_end_flag = false
      action_loop_index = 0
      until action_end_flag
        sorted_by_dex_mobs.each do |mob|
          next if mob.dead? or mob.retreated?

          # Action phase
          if mob.act_turn?
            if distance > 1
              x_phys_atk(battle_turn, mob, distance) unless mob.x_range < distance
            else
              pre_move_vpos = mob.vpos.to_s
              if mob.vpos_move
                p atk_side_to_s(mob.first_atk?) + ":" + mob.name_with_job + ":移動前:" + pre_move_vpos + ",移動後:" + mob.vpos.to_s
                add_battle_log(battle_turn, mob.id, pre_move_vpos, mob.vpos, nil, false, nil, 0)
                next
              end

              battle_method = mob.battle_act
              next if battle_method.blank?
              #p battle_method

              case battle_method.type
              when :spt
                cast_spt(battle_turn, mob, battle_method.method_id)
              when :phyz
                phys_atk(battle_turn, mob)
              when :atk
                cast_skill(battle_turn, mob, battle_method.method_id)
              when :heal
                cast_skill(battle_turn, mob, battle_method.method_id)
              end
            end
            mob_actioned_flag = true
          end
        end
        action_end_flag = true if mob_actioned_flag
        action_loop_index += 1
        action_end_flag = true if action_loop_index > 100
      end
      if distance > 1
        battle_end_flag = true
      else
        if first_atk_squad.annihilated?
          battle_turn.log = "攻撃側全滅(" + first_atk_squad.name + ")。"
        elsif second_atk_squad.annihilated?
          battle_turn.log = "防御側全滅(" + second_atk_squad.name + ")。"
        elsif first_atk_squad.retreated_from_battle?
          battle_turn.log = "攻撃側撤退。(" + first_atk_squad.name + ")。"
        elsif second_atk_squad.retreated_from_battle?
          battle_turn.log = "防御側撤退。(" + second_atk_squad.name + ")。"
        end
        battle_turn.save
        turn.medium_battle_turns << battle_turn
        unless battle_turn.log.blank?
          p battle_turn.log
          battle_end_flag = true
        end
        battle_loop_index += 1
        battle_end_flag = true if battle_loop_index > 100
        first_battle_turn_flag = false
      end     
    end

    # Battle end phase
    (first_atk_mobs + second_atk_mobs).each do |mob|
      mob.medium_battle_effect_invs.clear
      mob.save
    end
  end

  def self.restore_all_mobs_status
    MediumMob.all.each do |mob|
      mob.medium_battle_effect_invs.clear
      if mob.hp < mob.max_hp or mob.sp < mob.max_sp
        mob.hp = mob.max_hp
        mob.sp = mob.max_sp
        p mob.name + mob.hp.to_s + "/" + mob.sp.to_s
        mob.save
      end
    end
    MediumBattleLog.destroy_all
  end

  private

  def self.atk_side_to_s(atk_flag)
    return "先攻" if atk_flag
    return "後攻"
  end

  def self.cast_spt(battle_turn, mob, skill_id)
    if skill_id == Consts::JOB_SKILLS[Consts::JOBS[:war]][:taunt]
      top_hate = 0
      mob.friends.each do |friend|
        top_hate = friend.hate if friend.hate > top_hate and friend.medium_job_id != Consts::JOBS[:war]
      end
      if mob.hate <= top_hate
        taunt_skill = MediumSkill.find(skill_id)
        mob.hate += Consts::TAUNT_HATE_INCREASE
        mob.use_sp(taunt_skill.sp_cost)
        p atk_side_to_s(mob.first_atk?) + ":" + mob.name_with_job + ":TAUNT!:" + mob.hate.to_s
        add_battle_log(battle_turn, mob.id, mob.vpos, mob.vpos, mob.id, false, taunt_skill.name, 0)
      end     
    elsif skill_id == Consts::JOB_SKILLS[Consts::JOBS[:war]][:shield]
      shield_skill = MediumSkill.find(skill_id)
      mob.add_effect(shield_skill.medium_status_mod_id, mob.id, shield_skill.duration)
      mob.use_sp(shield_skill.sp_cost)
      p atk_side_to_s(mob.first_atk?) + ":" + mob.name_with_job + ":SHILED!:" + shield_skill.medium_status_mod.name
      add_battle_log(battle_turn, mob.id, mob.vpos, mob.vpos, mob.id, false, shield_skill.name, 0)
      # add_log
    end
  end

  def self.phys_atk(battle_turn, mob)
    mob.wepons.each do |wepon|
      targets = mob.atk_targets(wepon.medium_atk_info.d_range, wepon.num_of_tgt)
      next if targets.nil?
      targets.each do |target|
        p atk_side_to_s(mob.first_atk?) + ":" + mob.name_with_job + ":PHYZ!:to " + target.name
        if hit?(wepon.medium_atk_info.hit_accuracy, mob.dex, target.dex)
          damage = calc_damage(wepon.medium_atk_info.inst_damage, mob.str, target.full_phys_def)
          damage = (damege / 2).round if target.shielded?
          target.update_hp(damage)
          mob.exp += damage
          mob.hate += damage
          p "target hp was damaged by " + damage.to_s + ", current hp is " + target.hp.to_s
          add_battle_log(battle_turn, mob.id, mob.vpos, mob.vpos, target.id, target.dead?, wepon.name, damage)
        end
      end     
    end
  end

  def self.x_phys_atk(battle_turn, mob, distance)
    mob.x_wepons.each do |x_wepon|
      targets = mob.x_atk_targets(x_wepon.num_of_tgt)
      next if targets.nil?
      targets.each do |target|
        p atk_side_to_s(mob.first_atk?) + ":" + mob.name_with_job + ":X_PHYZ!:to " + target.name
        modified_accuracy = x_wepon.medium_atk_info.hit_accuracy
        modified_accuracy += calc_hit_mod_by_stack_penalty(target.friends.length)
        modified_accuracy += calc_hit_mod_by_distance(distance)

        if hit?(modified_accuracy, mob.dex, target.dex)
          damage = calc_damage(x_wepon.medium_atk_info.inst_damage, mob.str, target.full_phys_def)
          damage = (damege / 2).round if target.shielded?
          mob.exp += damage
          mob.hate += damage
          target.update_hp(damage)
          p "target hp was damaged by " + damage.to_s + ", current hp is " + target.hp.to_s
          add_battle_log(battle_turn, mob.id, mob.vpos, mob.vpos, target.id, target.dead?, x_wepon.name, damage)
        end
      end     

    end
  end

  def self.cast_skill(battle_turn, mob, skill_id)
    skill = MediumSkill.find(skill_id)
    p skill.name
    targets = mob.atk_targets(skill.medium_atk_info.d_range, skill.num_of_tgt) if not skill.heal?
    targets = mob.heal_targets(skill.medium_atk_info.d_range, skill.num_of_tgt) if skill.heal?
    return if targets.nil?

    targets.each do |target|
      p atk_side_to_s(mob.first_atk?) + ":" + mob.name_with_job + ":SKILL!:to " + target.name
      if hit?(skill.medium_atk_info.hit_accuracy, mob.wis, target.wis)
        hp_mod = calc_damage(skill.medium_atk_info.inst_damage, mob.int, target.full_skill_def) if not skill.heal?
        hp_mod = -1 * calc_damage(skill.medium_atk_info.inst_damage.abs, mob.int, Consts::BATTLE_RATE_DENOMINATOR) if skill.heal?
        mob.exp += hp_mod.abs
        mob.hate += hp_mod.abs
        target.update_hp(hp_mod)
        p "target hp was modified by " + hp_mod.to_s + ", current hp is " + target.hp.to_s
        add_battle_log(battle_turn, mob.id, mob.vpos, mob.vpos, target.id, target.dead?, skill.name, hp_mod)
        unless skill.medium_status_mod.blank?
          target.add_effect(skill.medium_status_mod_id, mob.id, skill.duration)
          #add_battle_log(battle_turn, mob.id, mob.vpos, mob.vpos, target.id, target.dead?, skill.medium_status_mod.name, 0)
        end
      end
    end     
  end

  def self.hit?(accuracy, mod, target_mod)
    #p "hit_target_mod:" + target_mod.to_s + "," + "hit_mod:" + mod.to_s
    hit_adjust = Consts::HIT_ADJUST_MAX * (target_mod - mod) / mod
    hit_adjust = Tools.filter_in_range(Consts::HIT_ADJUST_MAX, hit_adjust)
    hit_rate = Tools.filter_percent(accuracy - (accuracy * hit_adjust))
    #p "hit_adjust:" + hit_adjust.to_s + "," + "hit_rate:" + hit_rate.to_s
    return rand(Consts::BATTLE_RATE_DENOMINATOR) <= hit_rate.round(2) * Consts::PERCENT_DENOMINATOR
  end

  def self.calc_damage(damage, mod, target_mod)
    #p "damage_target_mod:" + target_mod.to_s + "," + "damage_mod:" + mod.to_s
    damage_adjust = Consts::DAMAGE_ADJUST_MAX * target_mod / (damage + mod)
    damage_adjust = Tools.filter_in_range(Consts::DAMAGE_ADJUST_MAX, damage_adjust)
    damage_rate = (damage + mod) * (1 - damage_adjust)
    calced_damage = Tools.gaussian_rand(damage_rate, damage_rate * Consts::DAMAGE_SD).round
    calced_damage = 1 if calced_damage == 0
    p "damage_adjust:" + damage_adjust.to_s  + "," + "damage:" + calced_damage.to_s
    return calced_damage
  end

  def self.calc_hit_mod_by_stack_penalty(size)
    stack_penalty = size - Consts::X_ATK_STACK_PENALTY_SIZE
    stack_penalty = 0 if stack_penalty < 0
    return stack_penalty * Consts::X_ATK_STACK_PENALTY_RATE
  end

  def self.calc_hit_mod_by_distance(distance)
    return distance * Consts::X_ATK_DISTANCE_PENALTY_RATE
  end

  def self.add_battle_log(battle_turn, mob_id, from_vpos, to_vpos, tgt_mob_id, tgt_mob_dead_flg, action, damage)
    trial = battle_turn.medium_trial_turn.medium_trial
    battle_log = MediumBattleLog.new
    battle_log.medium_battle_turn_id = battle_turn.id
    battle_log.trial_mob_id = trial.convert_to_trial_mob_id(mob_id)
    battle_log.from_vpos = from_vpos
    battle_log.to_vpos = to_vpos
    battle_log.tgt_id = trial.convert_to_trial_mob_id(tgt_mob_id)
    battle_log.tgt_dead_flg = tgt_mob_dead_flg
    battle_log.action = action
    battle_log.damage = damage
    battle_turn.medium_battle_logs << battle_log
  end
end