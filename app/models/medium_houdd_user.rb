class MediumHouddUser < ActiveRecord::Base
  has_many :medium_maps
  has_many :medium_research_allotments, :dependent => :delete_all
  has_many :medium_item_manufacture_ques, :dependent => :delete_all
  has_many :medium_construction_ques, :dependent => :delete_all
  has_many :medium_squads
  has_many :medium_mobs
  has_many :medium_missions, :dependent => :delete_all
  has_many :medium_mission_strategies, :dependent => :delete_all

  def food_total
    food_total = 0
    medium_maps.each do |map|
      food_total += map.food_total
    end
    return food_total
  end

  def hammer_total
    hammer_total = 0
    medium_maps.each do |map|
      hammer_total += map.hammer_total
    end
    return hammer_total
  end

  def gold_total
    gold_total = 0
    medium_maps.each do |map|
      gold_total += map.gold_total
    end
    return gold_total
  end

  def under_constructions
    under_constructions = Array.new
    medium_maps.each do |map|
      under_constructions.concat(map.under_constructions)
    end
    return under_constructions
  end
end
