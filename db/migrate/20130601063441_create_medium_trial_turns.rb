class CreateMediumTrialTurns < ActiveRecord::Migration
  def change
    create_table :medium_trial_turns do |t|
      t.references :medium_trial
      t.text :log

      t.timestamps
    end
    add_index :medium_trial_turns, :medium_trial_id
  end
end
