class MediumDungeon < ActiveRecord::Base
  belongs_to :medium_map_cell
  has_many :medium_dungeon_cells

  def cell(point)
    medium_dungeon_cells.each do |cell|
      return cell if point.equal?(cell)
    end
    return nil
  end

  def exit_cells
    exit_cells = Array.new
    medium_dungeon_cells.each do |cell|
      exit_cells << cell if cell.symbol == Consts::DUNGEON_COCRETE_SYMBOL and 
                           (cell.x == 0 or cell.x == read_attribute(:x) or cell.y == 0 or cell.y == read_attribute(:y))
    end
    return exit_cells
  end

  def exit_point?(point)
    exit_cells.each do |cell|
      return true if point.equal?(cell)
    end
    return false
  end

  def all_traps
    all_traps = Array.new
    medium_dungeon_cells.each do |cell|
      all_traps << cell.trap unless cell.trap
    end
    return all_traps
  end

  def nearest_exit_point(point)
    nearest_cell = nil
    nearest_distance = 9999
    exit_cells.each do |cell|
      distance = Tools.calc_distance2(point, cell)
      if distance < nearest_distance
        nearest_distance = distance
        nearest_cell = cell
      end
    end
    return Point.new(nearest_cell.x, nearest_cell.y)
  end

  def no_entry?(point)
    cell = medium_dungeon_cells.find_by_x_and_y(point.x, point.y)
    return false if cell.blank?
    if cell.symbol == Consts::DUNGEON_COCRETE_SYMBOL
      return false
    else
      return true
    end
  end

  def center_cell
    center_x = medium_dungeon_cells.maximum('x') + 1
    center_y = medium_dungeon_cells.maximum('y') + 1
    return Point.new(center_x, center_y)
  end
end
