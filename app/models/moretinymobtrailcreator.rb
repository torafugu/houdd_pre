class Moretinymobtrailcreator

  def Moretinymobtrailcreator.create(map_id)

    # List mobs belong to the map.
    map =  Moretinymap.find(map_id, :include => {:moretinymobs => :moretinymobinfo})
    Moretinymobtrail.destroy_all
    Moretinymobbattle.destroy_all

    # Array of guard mobs
    guardMobs = Array.new
    intruderMobs = Array.new
    
    map.moretinymobs.each do |mob|
      if mob.is_guard then
        guardMobs << mob
      else
        intruderMobs << mob
      end
    end

    # Calculate distance from intruder to guards
    # Sort target gurads mobs
    guardMobs.each do |guard|
      distance = Math.sqrt((guard.start_x - intruderMobs[0].start_x)**2 + (guard.start_y - intruderMobs[0].start_y)**2)
      guard.distance = distance
    end
    
    sorted_guards = guardMobs.sort{|a,b|
      a.distance <=> b.distance
    }
    
    trail = ""
    trail_step = 0
    currentX = intruderMobs[0].start_x
    currentY = intruderMobs[0].start_y
    sorted_guards.each do |sorted_guard|
      
      toMoveX = currentX - sorted_guard.start_x
      toMoveY = currentY - sorted_guard.start_y

      if toMoveX > 0
        while toMoveX > 0
          trail << "W"
          trail_step += 1 
          toMoveX -= 1
          currentX -= 1
        end
      elsif toMoveX < 0
        while toMoveX < 0
          trail << "E"
          trail_step += 1 
          toMoveX += 1
          currentX += 1
        end
      end
      if toMoveY > 0
        while toMoveY > 0
          trail << "N"
          trail_step += 1 
          toMoveY -= 1
          currentY -= 1
        end
      elsif toMoveY < 0
        while toMoveY > 0
          trail << "S"
          trail_step += 1 
          toMoveY += 1
          currentY += 1
        end
      end

      Moretinymobbattlecreator.create(trail_step, intruderMobs[0], sorted_guard)
      break if intruderMobs[0].is_dead
    end
    
    trail << "."
    puts trail 
    
    mobtrail = Moretinymobtrail.new
    mobtrail.moretinymob_id = intruderMobs[0].id
    mobtrail.trail = trail
    mobtrail.save
    return Moretinymobtrail.all
  end
end
