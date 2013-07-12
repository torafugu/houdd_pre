class CreateMediumTrialDungeonCells < ActiveRecord::Migration
  def change
    create_table :medium_trial_dungeon_cells do |t|
      t.references :medium_trial
      t.string :symbol
      t.integer :x
      t.integer :y

      t.timestamps
    end
    add_index :medium_trial_dungeon_cells, :medium_trial_id
  end
end
