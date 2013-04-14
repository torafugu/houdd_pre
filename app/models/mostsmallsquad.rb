class Mostsmallsquad < ActiveRecord::Base
  belongs_to :mostsmalluser
  belongs_to :mostsmallterritory
  has_many :mostsmallmobs

  attr_accessor :cpoint
  attr_accessor :dpoint
  attr_accessor :target_squad
  attr_accessor :distance
  attr_accessor :ss_dex
  
  def adjacent_of_cpoint(direction)
    case direction
    when 'E'
      return {"x"=>@cpoint['x'] + 1, "y"=>@cpoint['y']}
    when 'W'
      return {"x"=>@cpoint['x'] - 1, "y"=>@cpoint['y']}
    when 'S'
      return {"x"=>@cpoint['x'], "y"=>@cpoint['y'] + 1}
    when 'N'
      return {"x"=>@cpoint['x'], "y"=>@cpoint['y'] - 1}
    end
  end

  def to_move_directions
    diff_to_target = {"x"=>@dpoint['x'] - @cpoint['x'], "y"=> @dpoint['y'] - @cpoint['y']}
    directions = Array.new
    if diff_to_target['x'] > 0
      directions << 'E'
    elsif diff_to_target['x'] < 0
      directions << 'W'
    end
    if diff_to_target['y'] > 0
      directions << 'S'
    elsif diff_to_target['y'] < 0
      directions << 'N'
    end
    return directions
  end

  def move(direction)
    case direction
    when 'E'
      @cpoint['x'] += 1
    when 'W'
      @cpoint['x'] -= 1
    when 'S'
      @cpoint['y'] += 1
    when 'N'
      @cpoint['y'] -= 1
    end
  end

  def retreat_from_dungeon
    @retreated_from_dungeon = true
  end

  def retreated_from_dungeon?
    return @retreated_from_dungeon
  end

  def annihilated?
    mostsmallmobs.each do |mob|
      return false unless mob.dead?
    end
    return true
  end

  def retreated?
    mostsmallmobs.each do |mob|
      return false if not mob.retreated? and not mob.dead?
    end
    return true
  end

  def fighting_will?
    mostsmallmobs.each do |mob|
      return true if mob.fighting_will?
    end
    return false
  end

  def dex
    dex = 999
    mostsmallmobs.each do |mob|
      unless mob.dead?
        dex = mob.dex if dex > mob.dex
      end
    end
    return dex
  end

  def thief?
    mostsmallmobs.each do |mob|
      return true unless mob.thief?
    end
    return false
  end

  def act?
    return true if not annihilated? and rand(10000) <= @ss_dex
    return false
  end

  def trap_disarmers
    trap_disarmers = Array.new
    mostsmallmobs.each do |mob|
      trap_disarmers << mob unless Mostsmallparams::THIEF_JOB_IDS.index(mob.mostsmalljob.id).nil?
    end
    return trap_disarmers
  end

  def living_mobs
    living_mobs = Array.new
    mostsmallmobs.each do |mob|
      living_mobs << mob unless mob.dead?
    end
    return living_mobs
  end

  def arrived?
    return true if @cpoint['x'] == @dpoint['x'] and @cpoint['y'] == @dpoint['y']
    return false
  end
end
