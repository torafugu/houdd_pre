class CreateMediumBattleTurns < ActiveRecord::Migration
  def change
    create_table :medium_battle_turns do |t|
      t.references :medium_trial_turn
      t.integer :battle_set_index
      t.integer :atk_trial_squad_id
      t.integer :def_trial_squad_id
      t.text :log

      t.timestamps
    end
    add_index :medium_battle_turns, :medium_trial_turn_id
  end
end
