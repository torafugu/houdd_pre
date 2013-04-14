# coding: utf-8

class Mostsmalltrialhandler

  def self.start(trial_id)
    trial = Mostsmalltrial.find(trial_id)
    prepare(trial)
    #turn_num = 1
    until trial.def_defeated? and trial.atk_defeated?
    #until turn_num > 10
      #p "ターン：" + turn_num.to_s
      execute_turn(trial)
      #turn_num += 1
      #break if turn_num > 15
    end
    trial.occured_at = Mostsmallhistory.last.days
    trial.save
  end

  def self.execute_turn(trial)
    turn = Mostsmalltrialturn.new(:mostsmalltrial_id => trial.id)
    turn.log = ""
    turn.save
    trial.mostsmalltrialturns << turn
    trial.living_squads.each do |squad|
      squad_trail = Mostsmallsquadtrail.new
      squad_trail.mostsmalltrialturn_id = turn.id
      squad_trail.squad_id = squad.id
      squad_trail.from_x = Marshal.load(Marshal.dump(squad.cpoint['x']))
      squad_trail.from_y = Marshal.load(Marshal.dump(squad.cpoint['y']))
      squad_trail.to_x = Marshal.load(Marshal.dump(squad.cpoint['x']))
      squad_trail.to_y = Marshal.load(Marshal.dump(squad.cpoint['y']))
      squad_trail.trail = ""
      squad_trail.is_annihilated = false
      squad_trail.save
      turn.mostsmallsquadtrails << squad_trail

      squad.mostsmallmobs.each do |mob|
        mob_status = Mostsmallmobstatus.new
        mob_status.mostsmalltrialturn_id = turn.id
        mob_status.mob_id = mob.id
        mob_status.start_hp = mob.hp
        mob_status.start_sp = mob.sp
        mob_status.save
        turn.mostsmallmobstatuses << mob_status
      end
    end

    is_battle_happen = false
    sorted_by_dex_squads = Tools.sort_by_dex(trial.living_squads)
    #turn_num = 1
    until is_battle_happen
      #p "num of living squads:" + sorted_by_dex_squads.size.to_s
      sorted_by_dex_squads.each do |squad|
        #p squad.name + "before.act:" + squad.ss_dex.to_s
        if squad.act?
          #p squad.name + ".act?"
          # 1. Move phase
          enemy_squads = nil
          friend_squads = nil
          is_def_squad = trial.def_squad?(squad)
          if is_def_squad
            enemy_squads = trial.living_atk_squads
            friend_squads = trial.living_def_squads
          else
            enemy_squads = trial.living_def_squads
            friend_squads = trial.living_atk_squads
          end
          if squad.fighting_will? and not enemy_squads.blank?
            enemy_squads.each do |enemy_squad|
              enemy_squad.distance = Tools.calc_distance(squad.cpoint, enemy_squad.cpoint)
            end
            sorted_enemy_squads = enemy_squads.sort{|a,b|
              a.distance <=> b.distance
            }
            squad.target_squad = sorted_enemy_squads[0]
            squad.dpoint = sorted_enemy_squads[0].cpoint
          else
            squad.target_squad = nil
            squad.dpoint = trial.mostsmallterritory.nearest_dungeon_exit(squad.cpoint)
          end

          trail_log = squad.name + "の目標→"
          trail_log += "(" + squad.dpoint['x'].to_s + "," + squad.dpoint['y'].to_s + ")"
          trail_log += " 移動(" + squad.cpoint['x'].to_s + "," + squad.cpoint['y'].to_s + ") から "

          squad_trail = turn.mostsmallsquadtrails.find_by_squad_id(squad.id)
          new_trail = next_trail(trial.mostsmallterritory, friend_squads, squad)
          updated_trail = squad_trail.trail + new_trail
          squad_trail.update_attribute(:trail, updated_trail)
          squad_trail.update_attribute(:to_x, Marshal.load(Marshal.dump(squad.cpoint['x'])))
          squad_trail.update_attribute(:to_y, Marshal.load(Marshal.dump(squad.cpoint['y'])))
          squad_trail.save

          trail_log += new_trail
          trail_log += "へ (" + squad_trail.to_x.to_s + "," + squad_trail.to_y.to_s + ")"
          #trail_log += " 戦意：" + squad.fighting_will?.to_s
          #trail_log += " 全滅：" + squad.annihilated?.to_s
          p trail_log

          # 2. Trap phase
          trap = trial.mostsmallterritory.trap(squad.cpoint)
          if  not trap.nil? and not is_def_squad
            Mostsmalltraphandler.execute(turn, trap, squad) 
          end

          # 3. Treasure search phase
          if squad.thief? and squad.fighting_will?
            treasure = trial.mostsmallterritory.treasure(squad.cpoint)
            unless treasure.blank?
              p "宝箱発見！"
              treasure.is_opened = true
              treasure.mostsmalltreasureitems.each do |item|
                item.mostsmallitem.mostsmalluser_id = squad.mostsmalluser.id
              end
            end
          end

          # 4. Battle encounter phase
          if squad.arrived? and not squad.target_squad.nil?
            battle_set = Mostsmallbattleset.new
            battle_set.mostsmalltrialturn_id = turn.id
            battle_set.atk_squad_id = squad.id
            battle_set.atk_squad = squad
            battle_set.def_squad_id = squad.target_squad.id
            battle_set.def_squad = squad.target_squad
            battle_set.save
            turn.mostsmallbattlesets << battle_set
          end

          # 5. Retreat from dungeon phase
          if squad.arrived? and squad.target_squad.nil?
            #p "squad.retreat_from_dungeon"
            squad.retreat_from_dungeon
          end
        end
        is_battle_happen = true if turn.mostsmallbattlesets.length > 0
      end
      #turn_num += 1
      #break if turn_num > 10
      break if trial.def_defeated? and trial.atk_defeated?
    end

    turn.mostsmallbattlesets.each do |battleset|
      if not battleset.atk_squad.annihilated? and not battleset.def_squad.annihilated?
        Mostsmallbattlehandler.execute(battleset)
      end
    end

    #p "after battle"

    trial.squads.each do |squad|
      squad_trail = turn.mostsmallsquadtrails.find_by_squad_id(squad.id)
      unless squad_trail.blank?
        squad_trail.is_annihilated = true if squad.annihilated?
        squad_trail.save
      end
      squad.mostsmallmobs.each do |mob|
        mob_status = turn.mostsmallmobstatuses.find_by_mob_id(mob.id)
        unless mob_status.blank?
          mob_status.end_hp = mob.hp
          mob_status.end_sp = mob.sp
          unless mob.mostsmallbattleeffectinventories.blank?
            mob_status.end_status = ""
            mob.mostsmallbattleeffectinventories.each do |battle_effect_inventory|
              mob_status.end_status += "," unless battle_effect_inventory = mob.mostsmallbattleeffectinventories.first
              mob_status.end_status += battle_effect_inventory.mostsmalleffect.name
            end
            mob_status.end_status = mob.sp
          end
          mob_status.save
        end
      end
    end
    turn.save
    trial.save
    #p turn.log
  end

  def self.prepare(trial)
    first_turn = Mostsmalltrialturn.new(:mostsmalltrial_id => trial.id)
    first_turn.save

    trial.living_squads.each do |squad|
      squadsetup_point = trial.mostsmallterritory.random_unique_inside_dungeon_point(trial.def_squad?(squad))
      squad_trail = Mostsmallsquadtrail.new
      squad_trail.mostsmalltrialturn_id = first_turn.id
      squad_trail.squad_id = squad.id
      squad_trail.from_x = squadsetup_point['x']
      squad_trail.from_y = squadsetup_point['y']
      squad_trail.to_x = squadsetup_point['x']
      squad_trail.to_y = squadsetup_point['y']
      squad_trail.trail = ""
      squad_trail.is_annihilated = false
      squad.cpoint = {"x"=> squadsetup_point['x'], "y"=> squadsetup_point['y']}
      squad_trail.save
      first_turn.mostsmallsquadtrails << squad_trail

      trial_squad = Mostsmalltrialsquad.new
      trial_squad.mostsmalltrial_id = trial.id
      trial_squad.squad_id = squad.id
      trial_squad.squad_name = squad.name
      trial_squad.save

      squad.mostsmallmobs.each do |mob|
        mob_status = Mostsmallmobstatus.new
        mob_status.mostsmalltrialturn_id = first_turn.id
        mob_status.mob_id = mob.id
        mob_status.start_hp = mob.hp
        mob_status.end_hp = mob.hp
        mob_status.start_sp = mob.sp
        mob_status.end_sp = mob.sp
        mob_status.save
        first_turn.mostsmallmobstatuses << mob_status

        trial_mob = Mostsmalltrialmob.new
        trial_mob.mostsmalltrialsquad_id = trial_squad.id
        trial_mob.mob_id = mob.id
        trial_mob.specie_name = mob.specie_name
        trial_mob.mob_name = mob.name
        trial_mob.max_hp = mob.max_hp
        trial_mob.max_sp = mob.max_sp
        trial_mob.save
        trial_squad.mostsmalltrialmobs << trial_mob
      end
      trial.mostsmalltrialsquads << trial_squad
    end
    first_turn.save
    trial.save
  end

  private

  def self.next_trail(territory, friend_squads, squad)
    to_move_directions = squad.to_move_directions
    # 1. Delete directions where the friend squad exists.
    to_move_directions.each do |direction|
      to_move_point = squad.adjacent_of_cpoint(direction)
      if occupied_point(friend_squads, to_move_point) or not territory.inside_dungeon?(to_move_point)
        to_move_directions.delete_if {|x| x == direction}
      end
    end
    trail = to_move_directions[rand(to_move_directions.length)] || ''
    squad.move(trail)
    return trail
  end

  def self.occupied_point(friend_squads, point)
    friend_squads.each do |friend_squad|
      return true if point['x'] == friend_squad.cpoint['x'] and point['y'] == friend_squad.cpoint['y']
    end
    return false
  end
end