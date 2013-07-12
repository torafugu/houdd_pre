class MediumSquad < ActiveRecord::Base
  belongs_to :medium_houdd_user
  belongs_to :medium_map
  has_many :medium_mobs

  attr_accessor :cpoint
  attr_accessor :dpoint
  attr_accessor :target
  attr_accessor :distance
  attr_accessor :ss_dex
  attr_accessor :enemies
  attr_accessor :friends

  def annihilated?
    medium_mobs.each do |mob|
      return false unless mob.dead?
    end
    return true
  end

  def entry
    @entry_flag = true
  end

  def entried?
    @entry_flag = false if @entry_flag.nil?
    return @entry_flag
  end

  def retreated_from_battle?
    medium_mobs.each do |mob|
      return false if not mob.retreated? and not mob.dead?
    end
    return true
  end

  def escape_from_dungeon
    @escaped_from_dungeon_flag = true
  end

  def escaped_from_dungeon?
    return false if @escaped_from_dungeon_flag.nil?
    return @escaped_from_dungeon_flag
  end

  def fighting_will?
    medium_mobs.each do |mob|
      return true if mob.fighting_will?
    end
    return false
  end

  def action_turn?
    return true if not annihilated? and rand(10000) <= @ss_dex
    return false
  end

  def direction_to_target
    return @dpoint.sub(@cpoint).identity
  end

  def divide_to_atk
    @atk_flag = true
  end

  def divide_to_def
    @atk_flag = false
  end

  def trap_disarmers
    trap_disarmers = Array.new
    medium_mobs.each do |mob|
      trap_disarmers << mob if mob.trap_disarmer?
    end
    return trap_disarmers
  end

  def treasure_searchers
    treasure_searchers = Array.new
    medium_mobs.each do |mob|
      treasure_searchers << mob if mob.treasure_searcher?
    end
    return treasure_searchers
  end

  def living_mobs
    living_mobs = Array.new
    medium_mobs.each do |mob|
      living_mobs << mob unless mob.dead?
    end
    return living_mobs
  end

  def atk?
    return @atk_flag
  end

  def dex
    dex = 9999
    medium_mobs.each do |mob|
      unless mob.dead?
        dex = mob.dex if dex > mob.dex
      end
    end
    return dex
  end

  def x_range
    x_range = 0
    medium_mobs.each do |mob|
      x_range = mob.x_range if x_range < mob.x_range and not mob.dead?
    end
    return x_range
  end

  def distance_to_target
    return Tools.calc_distance2(@cpoint, @dpoint)
  end

  def in_battle_range?
    return false if @target.nil?
    return true if distance_to_target <= x_range
    return true if distance_to_target == 0
    return false
  end

  def initialize_cpoint(x, y)
    @cpoint = Point.new(x, y)
  end
end
