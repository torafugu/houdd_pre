class Mostsmallterritory < ActiveRecord::Base
  belongs_to :mostsmalluser
  has_many :mostsmallconstructions, :dependent => :delete_all
  has_many :mostsmalltraps, :dependent => :delete_all
  has_many :mostsmalltreasurechests, :dependent => :delete_all

  X_SIZE_NORMAL = 10
  Y_SIZE_NORMAL = 10

  def num_of_terrain(terrain_symbol)
    num_of_terrain = 0
    x_size = read_attribute(:map_txt).split("|")[0].length
    y_size = read_attribute(:map_txt).split("|").length
    y_size.times do |y|
      x_size.times do |x|
        map_cell_text = read_attribute(:map_txt).split("|")[y].slice(x)
        if map_cell_text == terrain_symbol.to_s
          num_of_terrain += 1
        end
      end
    end
    return num_of_terrain
  end

  def num_of_const(constinfo_id, comp_flag)
    num_of_construction = 0
    mostsmallconstructions.each do |const|
      if const.mostsmallconstructioninfo.id == constinfo_id and const.completed? == comp_flag
        num_of_construction += 1
      end
    end
    return num_of_construction
  end

  def num_of_trap(trapinfo_id, comp_flag)
    num_of_trap = 0
    mostsmalltraps.each do |trap|
      if trap.mostsmalltrapinfo.id == trapinfo_id and trap.completed? == comp_flag
        num_of_trap += 1
      end
    end
    return num_of_trap
  end

  def prod_resource_terrain(resource_id)
    prod_resource = 0
    Mostsmallterrain.all.each do |terrain|
      prod_resource += num_of_terrain(terrain.symbol) * terrain.prod_resource(resource_id)
    end
    return prod_resource
  end

  def prod_resource_construction(resource_id)
    prod_resource = 0
    mostsmallconstructions.each do |construction|
      prod_resource += construction.prod_resource(resource_id)
    end
    return prod_resource
  end

  def self.random_map_txt
    random_map_txt = ""
    Y_SIZE_NORMAL.times do |y|
      X_SIZE_NORMAL.times do |x|
        random_map_txt += Mostsmallterrain.find(rand(Mostsmallterrain.all.size) + 1).symbol
      end
      random_map_txt += "|"
    end
    return random_map_txt.chop
  end

  def random_unique_inside_dungeon_point(is_defender)
    clear_vacant_dungeon_points if @def_vacant_points.nil? or @atk_vacant_points.nil?
    if is_defender
      return false if @def_vacant_points.empty?
      return @def_vacant_points.delete_at(rand(@def_vacant_points.length))
    elsif not is_defender
      return false if @atk_vacant_points.empty?
      return @atk_vacant_points.delete_at(rand(@atk_vacant_points.length))
    end
  end

  def clear_vacant_dungeon_points
    @def_vacant_points = Array.new if @def_vacant_points.nil?
    @atk_vacant_points = Array.new if @atk_vacant_points.nil?
    dungeon_ysize.times do |y|
      dungeon_xsize.times do |x|
        dungeon_cell = {"x"=> x, "y"=> y}
        dungeon_cell_text = read_attribute(:dungeon_txt).split("|")[y].slice(x)
        if dungeon_cell_text == '1' and not on_outer_dungeon_border?(dungeon_cell)
          @def_vacant_points << dungeon_cell
        elsif dungeon_cell_text == '1' and on_outer_dungeon_border?(dungeon_cell)
          @atk_vacant_points << dungeon_cell
        end
      end
    end
  end

  def random_inside_dungeon_point(is_def)
    while
      dungeon_cell = random_dungeon_point
      dungeon_cell_text = read_attribute(:dungeon_txt).split("|")[dungeon_cell['y']].slice(dungeon_cell['x'])

      if dungeon_cell_text == '1' and not on_outer_dungeon_border?(dungeon_cell) and is_def
        return dungeon_cell
      elsif dungeon_cell_text == '1' and on_outer_dungeon_border?(dungeon_cell) and not is_def
        return dungeon_cell
      end
    end
  end

  def random_dungeon_point
    return {"x"=> rand(dungeon_xsize), "y"=> rand(dungeon_ysize)}
  end

  def on_outer_dungeon_border?(point)
    return true if point['x'] == 0
    return true if point['y'] == 0
    return true if point['x'] == dungeon_xsize - 1
    return true if point['y'] == dungeon_ysize - 1
    return false
  end

  def inside_dungeon?(point)
    return false if point['x'] > dungeon_xsize - 1
    return false if point['y'] > dungeon_ysize - 1

    dungeon_cell_text = read_attribute(:dungeon_txt).split("|")[point['y']].slice(point['x'])
    return true if dungeon_cell_text == '1'
    return false
  end

  def dungeon_xsize
    # This function assumes map is rectangle.
    return read_attribute(:dungeon_txt).split("|")[0].length
  end

  def dungeon_ysize
    return read_attribute(:dungeon_txt).split("|").length
  end

  def nearest_dungeon_exit(point)
    exit_points = Array.new
    dungeon_text = read_attribute(:dungeon_txt)
    dungeon_ysize.times do |y|
      dungeon_xsize.times do |x|
        dungeon_cell = {"x"=> x, "y"=> y}
        dungeon_cell_text = dungeon_text.split("|")[y].slice(x)
        if dungeon_cell_text == '1' and on_outer_dungeon_border?(dungeon_cell)
          exit_points << dungeon_cell
        end
      end
    end
    nearest_distance = 100000
    nearest_exit = nil
    exit_points.each do |exit_point|
      distance_to_exit = Tools.calc_distance(point, exit_point)
      if distance_to_exit < nearest_distance
        nearest_distance = distance_to_exit 
        nearest_exit = exit_point
      end
    end
    return nearest_exit
  end

  def trap(point)
    mostsmalltraps.each do |trap|
      return trap if point['x'] == trap.dungeon_x and point['y'] == trap.dungeon_y and trap.active?
    end
    return nil
  end

  def treasure(point)
    mostsmalltreasurechests.each do |treasure|
      return treasure if point['x'] == treasure.dungeon_x and point['y'] == treasure.dungeon_y and not treasure.is_opened
    end
    return nil
  end
end
