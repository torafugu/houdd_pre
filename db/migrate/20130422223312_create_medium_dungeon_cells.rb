class CreateMediumDungeonCells < ActiveRecord::Migration
  def change
    create_table :medium_dungeon_cells do |t|
      t.references :medium_dungeon
      t.string :symbol
      t.integer :x
      t.integer :y
      t.integer :trap_id
      t.integer :tc_disarm_rate
      t.references :medium_squad

      t.timestamps
    end
    add_index :medium_dungeon_cells, :medium_dungeon_id
    add_index :medium_dungeon_cells, :medium_squad_id
  end
end
