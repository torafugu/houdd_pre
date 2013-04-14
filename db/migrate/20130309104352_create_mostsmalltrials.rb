class CreateMostsmalltrials < ActiveRecord::Migration
  def change
    create_table :mostsmalltrials do |t|
      t.references :mostsmallterritory
      t.string :territory_name
      t.text :dungeon_txt
      t.integer :def_mission_id
      t.integer :atk_mission_id
      t.integer :occured_at

      t.timestamps
    end
    add_index :mostsmalltrials, :mostsmallterritory_id
  end
end
