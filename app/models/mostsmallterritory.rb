class Mostsmallterritory < ActiveRecord::Base
  belongs_to :mostsmalluser
  has_many :mostsmallconstructions, :dependent => :delete_all
  has_many :mostsmalltraps, :dependent => :delete_all

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
      if const.mostsmallconstructioninfo.id == constinfo_id and const.is_completed == comp_flag
        num_of_construction += 1
      end
    end
    return num_of_construction
  end

  def num_of_trap(trapinfo_id, comp_flag)
    num_of_trap = 0
    mostsmalltraps.each do |dtrap|
      if dtrap.mostsmalltrapinfo.id == trapinfo_id and dtrap.is_completed == comp_flag
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
end
