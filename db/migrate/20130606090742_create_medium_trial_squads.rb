class CreateMediumTrialSquads < ActiveRecord::Migration
  def change
    create_table :medium_trial_squads do |t|
      t.references :medium_trial
      t.integer :squad_id
      t.string :squad_name

      t.timestamps
    end
    add_index :medium_trial_squads, :medium_trial_id
  end
end
