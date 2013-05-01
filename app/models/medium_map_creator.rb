class MediumMapCreator
  def self.random_cell(map_id)
    MediumMapCell.destroy_all(["medium_map_id = ?", map_id])

    map_x_size = Consts::NORMAL_MAP_X_SIZE
    map_y_size = Consts::NORMAL_MAP_Y_SIZE

    plain_info = MediumTerrain.find_by_symbol(Consts::MAP_PLAIN_SYMBOL)
    mountain_info = MediumTerrain.find_by_symbol(Consts::MAP_MOUNTAIN_SYMBOL)
    sea_info = MediumTerrain.find_by_symbol(Consts::MAP_SEA_SYMBOL)

    iron_info = MediumResource.find_by_symbol(Consts::MAP_IRON_SYMBOL)
    gold_info = MediumResource.find_by_symbol(Consts::MAP_GOLD_SYMBOL)
    animal_info = MediumResource.find_by_symbol(Consts::MAP_ANIMAL_SYMBOL)
    cotton_info = MediumResource.find_by_symbol(Consts::MAP_COTTON_SYMBOL)
    fish_info = MediumResource.find_by_symbol(Consts::MAP_FISH_SYMBOL)
    terrain = Array.new(map_y_size).map!{Array.new(map_x_size, 0)}

    map_y_size.times do |y|
      map_x_size.times do |x|
        map_cell = MediumMapCell.new
        map_cell.medium_map_id = map_id
        map_cell.x = x
        map_cell.y = y

        # Calculation of relative terrain frequency
        plain_ratio = plain_info.freq_rate
        mountain_ratio = mountain_info.freq_rate
        sea_ratio = sea_info.freq_rate

        mountain_ratio_mod = calc_continuous_freq_rate(mountain_info, x, y, terrain)
        sea_ratio_mod = calc_continuous_freq_rate(sea_info, x, y, terrain)
        if mountain_ratio_mod > 0
          mountain_ratio += mountain_ratio_mod
          sea_ratio = ((10000 - mountain_ratio) * sea_ratio / (plain_ratio + sea_ratio)).round
          plain_ratio = 10000 - mountain_ratio - sea_ratio
        elsif sea_ratio_mod > 0
          sea_ratio += sea_ratio_mod
          mountain_ratio = ((10000 - sea_ratio) * mountain_ratio / (plain_ratio + mountain_ratio)).round
          plain_ratio = 10000 - mountain_ratio - sea_ratio
        end
        #p plain_ratio.to_s + "," + mountain_ratio.to_s + "," + sea_ratio.to_s

        terrain_roll = rand(10000)
        resource_roll = rand(10000)
        #p terrain_roll.to_s + "%"
        if terrain_roll < sea_ratio
          terrain[x][y] = sea_info.symbol
          map_cell.medium_terrain_id = sea_info.id
          if resource_roll < fish_info.freq_rate
            map_cell.medium_resource_id = fish_info.id
          end
        elsif terrain_roll.between?(sea_ratio, sea_ratio + mountain_ratio)
          terrain[x][y] = mountain_info.symbol
          map_cell.medium_terrain_id = mountain_info.id
          if resource_roll < iron_info.freq_rate
            map_cell.medium_resource_id = iron_info.id
          elsif resource_roll.between?(iron_info.freq_rate, iron_info.freq_rate + gold_info.freq_rate)
            map_cell.medium_resource_id = gold_info.id
          end
        else
          terrain[x][y] = plain_info.symbol
          map_cell.medium_terrain_id = plain_info.id
          if resource_roll < animal_info.freq_rate
            map_cell.medium_resource_id = animal_info.id
          elsif resource_roll.between?(animal_info.freq_rate, animal_info.freq_rate + cotton_info.freq_rate)
            map_cell.medium_resource_id = cotton_info.id
          end
        end
        map_cell.save
        # resource
      end
    end
  end

  def self.blank_cell(map_id)
    MediumMapCell.destroy_all(["medium_map_id = ?", map_id])

    map_x_size = Consts::NORMAL_MAP_X_SIZE
    map_y_size = Consts::NORMAL_MAP_Y_SIZE

    map_x_size.times do |y|
      map_x_size.times do |x|
        map_cell = MediumMapCell.new
        map_cell.medium_map_id = map_id
        map_cell.x = x
        map_cell.y = y
        map_cell.medium_terrain_id = MediumTerrain.find_by_symbol(Consts::MAP_PLAIN_SYMBOL).id
        map_cell.save
      end
    end
  end

  private

  def self.calc_continuous_freq_rate(terrain_info, x, y, terrain)
    ratio_mod = 0
    if x == 0 and y == 0
      return ratio_mod
    elsif x == 0 and y > 0
      ratio_mod += terrain_info.continuity_mod if terrain[0][y - 1] == terrain_info.symbol
    elsif x > 0 and y == 0
      ratio_mod += terrain_info.continuity_mod if terrain[x - 1][0] == terrain_info.symbol
    elsif x > 0 and y > 0
      ratio_mod += terrain_info.continuity_mod if terrain[x - 1][y - 1] == terrain_info.symbol
      ratio_mod += terrain_info.continuity_mod if terrain[x][y - 1] == terrain_info.symbol
      ratio_mod += terrain_info.continuity_mod if terrain[x - 1][y] == terrain_info.symbol
    end
    return ratio_mod
  end
end