# coding: utf-8

class MediumUpdateTrial
  def self.execute
    MediumMap.all.each do |map|
      dungeon = map.all_dungeons.first
      next if dungeon.blank?
      atk_missions = MediumMission.find_all_by_medium_map_id_and_completed_flg_and_category_sym(map.id, false, Consts::MISSION_ATK_SYMBOL)
      next if atk_missions.blank?
      def_missions = MediumMission.find_all_by_medium_map_id_and_completed_flg_and_category_sym(map.id, false, Consts::MISSION_DEF_SYMBOL)
      next if def_missions.blank?
      trial = MediumTrial.new
      trial.medium_map_id = map.id
      trial.map_name = map.name
      trial.def_mission_id = def_missions.shuffle.first.id
      trial.atk_mission_id = atk_missions.shuffle.first.id
      trial.dungeon_name = dungeon.name
      trial.dungeon_type_sym = dungeon.type_sym
      trial.save
      start(trial)
    end
  end

  def self.start(trial)
    prepare(trial)
    p trial.active_squads
    turn_num = 1
    until trial.def_defeated? and trial.atk_defeated?
    #100.times do |turn_num|
      squad_setup(trial)
      break if trial.active_squads.blank?
      p "-- proceed_turn " + turn_num.to_s + " --"
      proceed_turn(trial)
      turn_num += 1
    end
    trial.occured_at = MediumHouddHistory.last.days
    trial.save
  end

  def self.proceed_turn(trial)
    turn = MediumTrialTurn.new(:medium_trial_id => trial.id)
    turn.log = ""
    turn.save
    trial.medium_trial_turns << turn

    trial.active_squads.each do |squad|
      squad_trail = MediumSquadTrail.new
      squad_trail.medium_trial_turn_id = turn.id
      squad_trail.trial_squad_id = trial.convert_to_trial_squad_id(squad.id)
      squad_trail.from_x = Marshal.load(Marshal.dump(squad.cpoint.x))
      squad_trail.from_y = Marshal.load(Marshal.dump(squad.cpoint.y))
      squad_trail.to_x = Marshal.load(Marshal.dump(squad.cpoint.x))
      squad_trail.to_y = Marshal.load(Marshal.dump(squad.cpoint.y))
      squad_trail.trail = ""
      squad_trail.annihilated_flg = false
      squad_trail.save
      turn.medium_squad_trails << squad_trail

      squad.medium_mobs.each do |mob|
        mob_status = MediumMobStatus.new
        mob_status.medium_trial_turn_id = turn.id
        mob_status.trial_mob_id = trial.convert_to_trial_mob_id(mob.id)
        mob_status.start_hp = mob.hp
        mob_status.start_sp = mob.sp
        mob_status.save
        turn.medium_mob_statuses << mob_status
      end
    end

    is_battle_happen = false
    battle_sets = Array.new
    sorted_by_dex_squads = Tools.sort_by_dex(trial.active_squads)
    # loop_num = 0
    until is_battle_happen
      sorted_by_dex_squads.each_with_index do |squad, turn_num|
        if squad.action_turn?
          p squad.name + ".act?"
          # 1. Move phase
          if squad.atk?
            squad.enemies = trial.active_def_squads
            squad.friends = trial.active_atk_squads
          else
            squad.enemies = trial.active_atk_squads
            squad.friends = trial.active_def_squads
          end

          if squad.fighting_will? and not squad.enemies.blank?
            squad.enemies.each do |enemy|
              enemy.distance = Tools.calc_distance2(squad.cpoint, enemy.cpoint)
            end
            sorted_enemies = squad.enemies.sort{|a,b|
              a.distance <=> b.distance
            }
            squad.target = sorted_enemies.first
            squad.dpoint = squad.target.cpoint
          else
            squad.target = nil
            squad.dpoint = trial.dungeon.nearest_exit_point(squad.cpoint)
          end

          trail_log = squad.name + "の目標→"
          trail_log += "(" + squad.dpoint.x.to_s + "," + squad.dpoint.y.to_s + ")"
          trail_log += " 移動(" + squad.cpoint.x.to_s + "," + squad.cpoint.y.to_s + ") から "

          squad_trail = turn.medium_squad_trails.find_by_trial_squad_id(trial.convert_to_trial_squad_id(squad.id))
          new_trail = ''
          @ii = 0
          while new_trail == ''
            new_trail = next_trail(trial.dungeon, squad)
            break if squad.dpoint.equal?(squad.cpoint) and squad.target.nil?
            break if squad.in_battle_range?
            if new_trail == ''
              squad.dpoint = Point.random 
              p "シャッフル後の目標：" + "(" + squad.dpoint.x.to_s + "," + squad.dpoint.y.to_s + ")"
            end
            @ii += 1
            break if @ii == 10
          end

          updated_trail = squad_trail.trail + new_trail
          squad_trail.update_attribute(:trail, updated_trail)
          squad_trail.update_attribute(:to_x, Marshal.load(Marshal.dump(squad.cpoint.x)))
          squad_trail.update_attribute(:to_y, Marshal.load(Marshal.dump(squad.cpoint.y)))
          squad_trail.save

          trail_log += new_trail
          trail_log += "(" + squad_trail.to_x.to_s + "," + squad_trail.to_y.to_s + ") へ"
          #trail_log += " 戦意：" + squad.fighting_will?.to_s
          #trail_log += " 全滅：" + squad.annihilated?.to_s
          p trail_log

          # 2. Trap phase
          current_cell = trial.dungeon.cell(squad.cpoint)
          if not current_cell.trap.nil? and not squad.atk?
            open_trap(turn, current_cell, squad)
          end

          # 3. Treasure search phase
          if not current_cell.medium_tc_item_invs.blank? and not squad.treasure_searchers.blank? and squad.fighting_will?
            current_cell.medium_tc_item_invs.each do |tc_item_inv|
              p "Treasure:" + tc_item_inv.medium_item.name + " was found."
              tc_item_inv.medium_item.medium_houdd_user_id = squad.medium_houdd_user_id
            end
            current_cell.medium_tc_item_invs.clear
          end

          # 4. Battle encounter phase
          if squad.in_battle_range? and not squad.target.nil?
            p squad.name + " is going to start a battle."
            battle_sets << {:first_atk => squad, :second_atk => squad.target, :distance => squad.distance_to_target}   
          end

          # 5. Retreat from dungeon phase
          if trial.dungeon.exit_point?(squad.cpoint) and trial.dungeon.exit_point?(squad.dpoint)
            p squad.name + " escaped from dungeon."
            squad.escape_from_dungeon
          end
        end
        is_battle_happen = true if battle_sets.length > 0
        #is_battle_happen = true
      end
      # break if loop_num > 20
      # loop_num += 1
      #p "trial.def_defeated? " + trial.def_defeated?.to_s
      #p "trial.atk_defeated? " + trial.atk_defeated?.to_s
      break if trial.def_defeated? and trial.atk_defeated?
    end

    battle_sets.each_with_index do |battle_set, index|
      if not battle_set[:first_atk].annihilated? and not battle_set[:second_atk].annihilated?
        #p "battle!"
        MediumUpdateBattle.execute(turn, index, battle_set[:first_atk], battle_set[:second_atk], battle_set[:distance])
      end
    end

    (trial.def_mission.medium_squads + trial.atk_mission.medium_squads).each do |squad|
      squad_trail = turn.medium_squad_trails.find_by_trial_squad_id(trial.convert_to_trial_squad_id(squad.id))
      unless squad_trail.blank?
        squad_trail.annihilated_flg = true if squad.annihilated?
        squad_trail.save
      end
      squad.medium_mobs.each do |mob|
        mob_status = turn.medium_mob_statuses.find_by_trial_mob_id(trial.convert_to_trial_mob_id(mob.id))
        unless mob_status.blank?
          mob_status.end_hp = mob.hp
          mob_status.end_sp = mob.sp
          mob_status.end_status = ''
          mob_status.save
        end
      end
    end
  end

  def self.prepare(trial)
    trial.dungeon.medium_dungeon_cells.each do |cell|
      trial_cell = MediumTrialDungeonCell.new
      trial_cell.medium_trial_id = trial.id
      trial_cell.symbol = cell.symbol
      trial_cell.x = cell.x
      trial_cell.y = cell.y
      trial_cell.save
      trial.medium_trial_dungeon_cells << trial_cell
    end

    squad_setup(trial)
    trial.save
  end

  def self.squad_setup(trial)
    remaining_exit_cells = trial.dungeon.exit_cells
    current_turn_num = trial.medium_trial_turns.length
    current_turn_num = 0 if current_turn_num.blank?
    (trial.def_mission.medium_squads + trial.atk_mission.medium_squads).each do |squad|
      if trial.def_mission.medium_squads.include?(squad)
        #p "current_turn_num:" + current_turn_num.to_s
        #p "entry_turn:" + trial.def_mission.strategy.squads[squad.id].entry_turn.to_s
        next if squad.entried?
        next if trial.def_mission.strategy.squads[squad.id].entry_turn != current_turn_num
        p squad.name + "is entried."
        squad.entry
        squad.divide_to_def
        deployed_cell = MediumDungeonCell.find_all_by_medium_dungeon_id_and_medium_squad_id(trial.dungeon.id, squad.id)
        squad.initialize_cpoint(deployed_cell.first.x, deployed_cell.first.y) unless deployed_cell.blank?
      else
        #p "current_turn_num:" + current_turn_num.to_s
        #p "entry_turn:" + trial.atk_mission.strategy.squads[squad.id].entry_turn.to_s
        next if squad.entried?
        next if trial.atk_mission.strategy.squads[squad.id].entry_turn != current_turn_num
        p squad.name + "is entried."
        squad.entry
        squad.divide_to_atk
        deployed_cell = remaining_exit_cells.shuffle.first
        remaining_exit_cells.delete(deployed_cell)
        squad.initialize_cpoint(deployed_cell.x, deployed_cell.y) unless deployed_cell.blank?
      end

      trial_squad = MediumTrialSquad.new
      trial_squad.medium_trial_id = trial.id
      trial_squad.squad_id = squad.id
      trial_squad.squad_name = squad.name
      trial_squad.save
      trial.medium_trial_squads << trial_squad

      squad.medium_mobs.each do |mob|
        if squad.atk?
          mob.strategy = trial.atk_mission.strategy.jobs[mob.medium_job_id]
        else
          mob.strategy = trial.def_mission.strategy.jobs[mob.medium_job_id]
        end

        trial_mob = MediumTrialMob.new
        trial_mob.medium_trial_squad_id = trial_squad.id
        trial_mob.mob_id = mob.id
        trial_mob.job_name = mob.medium_job.name
        trial_mob.mob_name = mob.name
        trial_mob.max_hp = mob.max_hp
        trial_mob.max_sp = mob.max_sp
        trial_mob.save
        trial_squad.medium_trial_mobs << trial_mob
      end
    end
  end

  private

  def self.next_trail(dungeon, squad)
    direction = squad.direction_to_target
    direction.x = 0 if dungeon.no_entry?(squad.cpoint.add(direction.identity_x)) or squad.dpoint.equal?(squad.cpoint.add(direction.identity_x))
    direction.y = 0 if dungeon.no_entry?(squad.cpoint.add(direction.identity_y)) or squad.dpoint.equal?(squad.cpoint.add(direction.identity_y))
    moving_direction = direction.identity_random
    squad.cpoint.add!(moving_direction)
    #p "移動方向:" + moving_direction.trail_str
    #p moving_direction
    return moving_direction.trail_str
  end

  def self.open_trap(turn, dungeon_cell, squad)
    return if dungeon_cell.trap.broken?

    # 1. Disarm trap
    squad.trap_disarmers.each do |disarmer|
      attempt_roll = rand(Consts::PERCENT_DENOMINATOR)
      log = nil
      disarm_rate = dungeon_cell.tc_disarm_rate
      disarm_rate = 0 if disarm_rate.nil?
      if disarm_rate <= attempt_roll
        turn.log += disarmer.name + "がトラップ(" + dungeon_cell.trap.name + ")の解除成功！\n"
        disarmer.exp += Consts::TRAP_DISARM_JOB_EXP
        dungeon_cell.trap.dp = 0
        break
      else
        turn.log += disarmer.name + "がトラップ(" + dungeon_cell.trap.mostsmalltrapinfo.name + ")の解除失敗！\n"
        disarmer.job_exp += Consts::TRAP_DISARM_JOB_EXP / 2
      end
    end

    return if dungeon_cell.trap.broken?

    # 2. Trigger trap
    extract_num = dungeon_cell.trap.num_of_tgt
    extract_num = squad.living_mobs.length if squad.living_mobs.length < extract_num
    damaged_mobs = squad.living_mobs.sample(extract_num)

    dungeon_cell.trap.dp -= 1
    damaged_mobs.each do |mob|
      damage_rate = dungeon_cell.trap.medium_item_info.medium_atk_info.inst_damage
      damage = Tools.gaussian_rand(damage_rate, damage_rate * Consts::DAMAGE_SD)
      mob.update_hp(damage)
      turn.log += mob.name + "がトラップ(" + dungeon_cell.trap.name + ")から" + damage.to_s + "のダメージを受けた。\n"
      turn.log += mob.name + "は死んだ！\n" if mob.dead?
    end
  end

  def self.clear_by_id(trial_id)
    trial = MediumTrial.find(trial_id)

    trial.medium_trial_turns.each do |turn|
      turn.medium_squad_trails.clear
      turn.medium_mob_statuses.clear
    end

    trial.medium_trial_squads.each do |squad|
      squad.medium_trial_mobs.clear
    end

    trial.destroy
  end
end