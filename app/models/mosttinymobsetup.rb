class Mosttinymobsetup < ActiveRecord::Base
  belongs_to :mosttinytrial
  belongs_to :mosttinymob
  has_many :mosttinymobtrails
  has_many :mosttinybattles

  def current_point
    return {"x"=> read_attribute(:current_x), "y"=> read_attribute(:current_y)}
  end

  def east_of_current_point
    return {"x"=> read_attribute(:current_x) + 1, "y"=> read_attribute(:current_y)}
  end

  def west_of_current_point
    return {"x"=> read_attribute(:current_x) - 1, "y"=> read_attribute(:current_y)}
  end

  def south_of_current_point
    return {"x"=> read_attribute(:current_x), "y"=> read_attribute(:current_y) + 1}
  end

  def north_of_current_point
    return {"x"=> read_attribute(:current_x), "y"=> read_attribute(:current_y) - 1}
  end

  def from_point
    return @from_point
  end

  def from_point=(point)
    return @from_point = point.dup
  end

  def destination_point=(point)
    @destination_point = point
    @distance_to_move = {"x"=> @destination_point['x'] - read_attribute(:current_x), "y"=> @destination_point['y'] - read_attribute(:current_y)}
  end

  def directions_to_move
    
    possible_directions = Array.new
    
    if @distance_to_move['x'] > 0
      possible_directions << 'E'
    elsif @distance_to_move['x'] < 0
      possible_directions << 'W'
    end

    if @distance_to_move['y'] > 0
      possible_directions << 'S'
    elsif @distance_to_move['y'] < 0
      possible_directions << 'N'
    end

    return possible_directions
  end

  def arrived_at_destination?
    if current_point == @destination_point
      return true
    else
      return false
    end
  end

  def move(direction)
    write_attribute(:current_x, read_attribute(:current_x) + 1) if direction == 'E'
    write_attribute(:current_x, read_attribute(:current_x) - 1) if direction == 'W'
    write_attribute(:current_y, read_attribute(:current_y) + 1) if direction == 'S'
    write_attribute(:current_y, read_attribute(:current_y) - 1) if direction == 'N'
  end
end
