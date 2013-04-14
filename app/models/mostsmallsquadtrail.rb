class Mostsmallsquadtrail < ActiveRecord::Base
  belongs_to :mostsmalltrialturn

  def defender?
    if mostsmalltrialturn.mostsmalltrial.def_squad?(Mostsmallsquad.find(read_attribute(:squad_id)))
      return true
    else
      return false
    end
  end

  def direction
    unless read_attribute(:trail).blank?
      return read_attribute(:trail).split("")[0]
    else
      dungeon_center_x = (mostsmalltrialturn.mostsmalltrial.mostsmallterritory.dungeon_xsize / 2).round
      dungeon_center_y = (mostsmalltrialturn.mostsmalltrial.mostsmallterritory.dungeon_ysize / 2).round
      to_center_x = dungeon_center_x - read_attribute(:from_x)
      to_center_y = dungeon_center_y - read_attribute(:from_y)
      if to_center_y.abs < to_center_x.abs
        if 0 < to_center_x
          return "E" if not defender?
          return "W" if defender?
        else
          return "W" if not defender?
          return "E" if defender?
        end
      else
        if 0 < to_center_y
          return "S" if not defender?
          return "N" if defender?
        else
          return "N" if not defender?
          return "S" if defender?
        end
      end
    end
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
    @points.last['is_end'] = 1 unless @points.blank?
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
    @point['is_end'] = 0
    @points << @point
    @from_x = @to_x
    @from_y = @to_y
    @cursor_x = 0
    @cursor_y = 0
  end
end
