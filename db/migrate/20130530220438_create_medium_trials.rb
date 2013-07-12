class CreateMediumTrials < ActiveRecord::Migration
  def change
    create_table :medium_trials do |t|
      t.references :medium_map
      t.string :map_name
      t.integer :def_mission_id
      t.integer :atk_mission_id
      t.integer :occured_at
      t.string :dungeon_name
      t.string :dungeon_type_sym

      t.timestamps
    end
    add_index :medium_trials, :medium_map_id
  end
end
