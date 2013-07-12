class MediumMap < ActiveRecord::Base
  belongs_to :medium_houdd_user
  has_many :medium_map_cells

  def food_total
    food_total = 0
    medium_map_cells.each do |cell|
      food_total += 1 if cell.medium_terrain.symbol == Consts::MAP_PLAIN_SYMBOL
    end
    return food_total
  end

  def hammer_total
    hammer_total = 0
    medium_map_cells.each do |cell|
      hammer_total += 1 if cell.medium_terrain.symbol == Consts::MAP_MOUNTAIN_SYMBOL
    end
    return hammer_total
  end

  def gold_total
    gold_total = 0
    #medium_map_cells.each do |cell|
    #  gold_total += 1 if cell.medium_terrain.symbol == Consts::MAP_PLAIN_SYMBOL
    #end
    return gold_total
  end

  def under_constructions
    under_constructions = Array.new
    medium_map_cells.each do |cell|
      construction_que = MediumConstructionQue.find_by_medium_map_cell_id(cell.id)
      under_const_description = ""
      unless construction_que.blank?
        under_const_description += read_attribute(:name)
        under_const_description += " X:" + cell.x.to_s + " Y:" + cell.y.to_s
        under_const_description += " " + construction_que.medium_construction.name
        under_constructions << under_const_description
      end
    end
    return under_constructions
  end

  def all_dungeons
    all_dungeons = Array.new
    medium_map_cells.each do |map_cell|
      all_dungeons << map_cell.medium_dungeon unless map_cell.medium_dungeon.blank?
    end
    return all_dungeons
  end
end
