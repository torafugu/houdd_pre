class Smallmap < ActiveRecord::Base
  belongs_to :smalluser
  has_many :smalltrials

  def random_unique_inside_point(is_guard)
    clear_vacant_points if @guard_vacant_points.nil? or @intruder_vacant_points.nil?
    if is_guard
      return false if @guard_vacant_points.empty?
      return @guard_vacant_points.delete_at(rand(@guard_vacant_points.length))
    elsif not is_guard
      return false if @intruder_vacant_points.empty?
      return @intruder_vacant_points.delete_at(rand(@intruder_vacant_points.length))
    end
  end

  def clear_vacant_points
    @guard_vacant_points = Array.new if @guard_vacant_points.nil?
    @intruder_vacant_points = Array.new if @intruder_vacant_points.nil?
    ysize.times do |y|
      xsize.times do |x|
        map_cell = {"x"=> x, "y"=> y}
        map_cell_text = read_attribute(:txt).split("|")[y].slice(x)
        if map_cell_text == '1' and not on_outer_border?(map_cell)
          @guard_vacant_points << map_cell
        elsif map_cell_text == '1' and on_outer_border?(map_cell)
          @intruder_vacant_points << map_cell
        end
      end
    end
  end

  def random_inside_point(is_guard)
    while
      map_cell = random_point
      map_cell_text = read_attribute(:txt).split("|")[map_cell['y']].slice(map_cell['x'])

      if map_cell_text == '1' and not on_outer_border?(map_cell) and is_guard
        return map_cell
      elsif map_cell_text == '1' and on_outer_border?(map_cell) and not is_guard
        return map_cell
      end
    end
  end

  def random_point
    return {"x"=> rand(xsize), "y"=> rand(ysize)}
  end

  def on_outer_border?(point)
    return true if point['x'] == 0
    return true if point['y'] == 0
    return true if point['x'] == xsize - 1
    return true if point['y'] == ysize - 1
    return false
  end

  def inside?(point)
    return false if point['x'] > xsize - 1
    return false if point['y'] > ysize - 1

    map_cell_text = read_attribute(:txt).split("|")[point['y']].slice(point['x'])
    return true if map_cell_text == '1'
    return false
  end

  def xsize
    # This function assumes map is rectangle.
    return read_attribute(:txt).split("|")[0].length
  end

  def ysize
    return read_attribute(:txt).split("|").length
  end
end
