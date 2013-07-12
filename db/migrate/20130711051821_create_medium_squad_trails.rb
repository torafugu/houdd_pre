class CreateMediumSquadTrails < ActiveRecord::Migration
  def change
    create_table :medium_squad_trails do |t|
      t.references :medium_trial_turn
      t.integer :trial_squad_id
      t.integer :from_x
      t.integer :from_y
      t.integer :to_x
      t.integer :to_y
      t.text :trail
      t.boolean :annihilated_flg

      t.timestamps
    end
    add_index :medium_squad_trails, :medium_trial_turn_id
  end
end
