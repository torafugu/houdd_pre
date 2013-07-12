class CreateMediumBattleLogs < ActiveRecord::Migration
  def change
    create_table :medium_battle_logs do |t|
      t.references :medium_battle_turn
      t.integer :trial_mob_id
      t.integer :from_vpos
      t.integer :to_vpos
      t.integer :tgt_id
      t.boolean :tgt_dead_flg
      t.string :action
      t.integer :damage

      t.timestamps
    end
    add_index :medium_battle_logs, :medium_battle_turn_id
  end
end
