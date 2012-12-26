class Smallturnsquadtrail < ActiveRecord::Base
  belongs_to :smalltrialturn

  def guard?
    def_squad_ids = smalltrialturn.smalltrial.def_mobunit.smallmobsquads.collect{|s| s.id}
    return true if def_squad_ids.include?(read_attribute(:squad_id))
    return false
  end

  def trailpoints
    @from_x = read_attribute(:from_x)
    @from_y = read_attribute(:from_y)
    @cursor_x = 0
    @cursor_y = 0
    @points = Array.new
    previous_direction = ""
    trails = read_attribute(:trail).split("")

    trails.each do |direction|
      previous_direction = direction if previous_direction.empty?
      if direction == previous_direction
        move_cursor(direction)
      else
        add_trailpoint
        previous_direction = direction
        move_cursor(direction)
      end
    end

    
    add_trailpoint if @cursor_x != 0 or @cursor_y != 0
    @points.last['is_end'] = true
    return @points
  end

  def move_cursor(direction)
    if direction == "N"
      @cursor_y -= 1
    elsif direction == "S"
      @cursor_y += 1
    elsif direction == "E"
      @cursor_x += 1
    elsif direction == "W"
      @cursor_x -= 1
    end
  end

  def add_trailpoint
    @point = Hash.new
    @to_x = @from_x + @cursor_x
    @to_y = @from_y + @cursor_y
    @point['from_x'] = @from_x.to_s
    @point['from_y'] = @from_y.to_s
    @point['to_x'] = @to_x.to_s
    @point['to_y'] = @to_y.to_s
    @point['is_end'] = false
    @points << @point
    @from_x = @to_x
    @from_y = @to_y
    @cursor_x = 0
    @cursor_y = 0
  end
end
