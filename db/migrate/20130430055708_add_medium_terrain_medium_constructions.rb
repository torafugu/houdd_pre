class AddMediumTerrainMediumConstructions < ActiveRecord::Migration
  def change
    add_column :medium_constructions, :medium_terrain_id, :integer
    add_index :medium_constructions, :medium_terrain_id
  end
end
