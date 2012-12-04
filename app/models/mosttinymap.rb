class Mosttinymap < ActiveRecord::Base
  belongs_to :mosttinyuser
  
  def random_unique_inside_point(is_guard)
    
    set_inside_points if @guard_vacant_points.nil? or @intruder_vacant_points.nil?
    
    if is_guard
      return false if @guard_vacant_points.empty?
      return @guard_vacant_points.delete_at(rand(@guard_vacant_points.length))
    elsif not is_guard
      return false if @intruder_vacant_points.empty?
      return @intruder_vacant_points.delete_at(rand(@intruder_vacant_points.length))

    end
  end
  
  def set_inside_points
    @guard_vacant_points = Array.new if @guard_vacant_points.nil?
    @intruder_vacant_points = Array.new if @intruder_vacant_points.nil?
    ysize.times do |y|
      xsize.times do |x|
        map_cell_text = read_attribute(:map).split("|")[y].slice(x)
        if map_cell_text == '1'
          @guard_vacant_points << {"x"=> x, "y"=> y}
        elsif map_cell_text == 'S'
          @intruder_vacant_points << {"x"=> x, "y"=> y}
        end
      end
    end
  end

  def random_inside_point(is_guard)
    while
      point = random_point
      map_cell_text = read_attribute(:map).split("|")[point['y']].slice(point['x'])
      if map_cell_text == '1' and is_guard
        return point
      elsif map_cell_text == 'S' and not is_guard
        return point
      end
    end
  end

  def random_point
    return {"x"=> rand(xsize), "y"=> rand(ysize)}
  end

  def xsize
    # This function assumes map is rectangle.
    return read_attribute(:map).split("|")[0].length
  end

  def ysize
    return read_attribute(:map).split("|").length
  end
end
