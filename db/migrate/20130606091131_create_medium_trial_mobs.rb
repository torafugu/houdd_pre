class CreateMediumTrialMobs < ActiveRecord::Migration
  def change
    create_table :medium_trial_mobs do |t|
      t.references :medium_trial_squad
      t.integer :mob_id
      t.string :job_name
      t.string :mob_name
      t.integer :max_hp
      t.integer :max_sp

      t.timestamps
    end
    add_index :medium_trial_mobs, :medium_trial_squad_id
  end
end
