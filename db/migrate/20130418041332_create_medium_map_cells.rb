class CreateMediumMapCells < ActiveRecord::Migration
  def change
    create_table :medium_map_cells do |t|
      t.references :medium_map
      t.integer :x
      t.integer :y
      t.references :medium_terrain
      t.references :medium_resource
      t.references :medium_construction
      t.references :medium_dungeon

      t.timestamps
    end
    add_index :medium_map_cells, :medium_map_id
    add_index :medium_map_cells, :medium_terrain_id
    add_index :medium_map_cells, :medium_resource_id
    add_index :medium_map_cells, :medium_construction_id
    add_index :medium_map_cells, :medium_dungeon_id
  end
end
