class CreateMediumMobStatuses < ActiveRecord::Migration
  def change
    create_table :medium_mob_statuses do |t|
      t.references :medium_trial_turn
      t.integer :trial_mob_id
      t.integer :start_hp
      t.integer :end_hp
      t.integer :start_sp
      t.integer :end_sp
      t.string :start_status
      t.string :end_status

      t.timestamps
    end
    add_index :medium_mob_statuses, :medium_trial_turn_id
  end
end
