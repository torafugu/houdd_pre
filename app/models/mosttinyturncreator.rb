# coding: utf-8

class Mosttinyturncreator

  def self.create_all_by_id(trial_id)

    mosttinytrial = Mosttinytrial.find(trial_id, :include => [:def_user, :atk_user, :def_strategy, :atk_strategy, {:mosttinymobsetups => {:mosttinymob => :mosttinymobinfo}}])

    is_guard_retreated = false
    is_intruder_retreated = false
    until is_guard_retreated or is_intruder_retreated
      create(mosttinytrial)
      is_guard_retreated = true if Mosttinystrategyhandler.retreat?(mosttinytrial, true)
      is_intruder_retreated = true if Mosttinystrategyhandler.retreat?(mosttinytrial, false)
    end
    
    turn = Mosttinyturn.new
    turn.mosttinytrial_id = mosttinytrial.id
    turn.log = "防御側撤退。\n" if is_guard_retreated
    turn.log = "攻撃側撤退。\n" if is_intruder_retreated
    turn.save
    mosttinytrial.is_completed = true
    mosttinytrial.save
  end

  def self.create_by_id(trial_id)

    mosttinytrial = Mosttinytrial.find(trial_id, :include => [:def_user, :atk_user, :def_strategy, :atk_strategy, {:mosttinymobsetups => {:mosttinymob => :mosttinymobinfo}}])
    create(mosttinytrial)
  end

  def self.create(mosttinytrial)
    
    mob_trails = Hash.new
    mob_from_points = Hash.new
    mob_battle_que = Array.new

    guard_mobs = Array.new
    intruder_mobs = Array.new 

    mosttinytrial.mosttinymobsetups.each do |mobsetup|
      mobsetup.from_point = mobsetup.current_point 
      mob_trails[mobsetup.id] = ''
      mob_from_points[mobsetup.id] = mobsetup.current_point
      if mobsetup.is_guard and not mobsetup.mosttinymob.is_dead
        guard_mobs << mobsetup
      elsif not mobsetup.is_guard and not mobsetup.mosttinymob.is_dead
        intruder_mobs << mobsetup
      end
    end

    is_battle_happen = false
    
    while not is_battle_happen 
      
      # 1. Intruders move first.
      intruder_mobs.each do |intruder|
        
        # Calculate distance from intruder mob to guard mob.
        guard_mobs.each do |guard|
          distance = Math.sqrt((guard.current_x - intruder.current_x) ** 2 + (guard.current_y - intruder.current_y) ** 2)
          guard.distance = distance
        end

        sorted_guards = guard_mobs.sort{|a,b|
          a.distance <=> b.distance
        }

        target_mob = sorted_guards[0]
        intruder.destination_point = target_mob.current_point 
        
        p intruder.mosttinymob.name
        p intruder.current_point
        p "target:"
        p target_mob.current_point

        trail = get_next_trail(intruder_mobs, intruder)
        mob_trails[intruder.id] += trail
        intruder.move(trail)

        p intruder.current_point

        mob_battle_que << {"src"=> intruder, "tgt"=> target_mob} if intruder.arrived_at_destination? 
      end

      # 2. Guards move next.
      guard_mobs.each do |guard|
        
        # Calculate distance from guard mob to intruder mob.
        intruder_mobs.each do |intruder|
          distance = Math.sqrt((intruder.current_x - guard.current_x) ** 2 + (intruder.current_y - guard.current_y) ** 2)
          intruder.distance = distance
        end

        sorted_intruder = intruder_mobs.sort{|a,b|
          a.distance <=> b.distance
        }

        target_mob = sorted_intruder[0]
        guard.destination_point = target_mob.current_point 
        
        p guard.mosttinymob.name
        p guard.current_point
        p "target:"
        p target_mob.current_point

        trail = get_next_trail(guard_mobs, guard)
        mob_trails[guard.id] += trail
        guard.move(trail)
        
        p guard.current_point
        
        mob_battle_que << {"src"=> guard, "tgt"=> target_mob} if guard.arrived_at_destination? 
        
        is_battle_happen = true if not mob_battle_que.empty?
      end
    end

    p mob_trails

    turn = Mosttinyturn.new
    turn.mosttinytrial_id = mosttinytrial.id
    turn.save

    mosttinytrial.mosttinymobsetups.each do |mob_setup|
      unless mob_setup.mosttinymob.is_dead
        mobtrail = Mosttinymobtrail.new
        mobtrail.mosttinyturn_id = turn.id
        mobtrail.mosttinymobsetup_id = mob_setup.id
        mobtrail.trail = mob_trails[mob_setup.id]
        mobtrail.from_x = mob_from_points[mob_setup.id]["x"]
        mobtrail.from_y = mob_from_points[mob_setup.id]["y"]
        mobtrail.to_x = mob_setup.current_x
        mobtrail.to_y = mob_setup.current_y
        mobtrail.save
      end
    end
    mob_battle_que.each do |mob_battle|
      unless mob_battle["src"].mosttinymob.is_dead or mob_battle["tgt"].mosttinymob.is_dead
        Mosttinybattlecreator.create(turn.id, mob_battle["src"], mob_battle["tgt"])
      end
    end
  end

  def self.get_next_trail(mobs, mob_myself)
    
    possible_directions = mob_myself.directions_to_move
    
    # Delete directions where friend mob exists.
    mobs.each do |mob|

      if (mob.current_point == mob_myself.east_of_current_point)
        possible_directions.delete_if {|x| x == 'E'}
      end

      if (mob.current_point == mob_myself.west_of_current_point)
        possible_directions.delete_if {|x| x == 'W'}
      end

      if (mob.current_point == mob_myself.south_of_current_point)
        possible_directions.delete_if {|x| x == 'S'}
      end

      if (mob.current_point == mob_myself.north_of_current_point)
        possible_directions.delete_if {|x| x == 'N'}
      end
    end

    trail = possible_directions[rand(possible_directions.length)]
    trail = '' if not trail
    p trail
    return trail
  end
end
