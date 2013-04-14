class CreateMostsmallbattleeffectinventories < ActiveRecord::Migration
  def change
    create_table :mostsmallbattleeffectinventories do |t|
      t.references :mostsmallmob
      t.references :mostsmalleffect
      t.integer :src_mob_id
      t.integer :remaining_duration

      t.timestamps
    end
    add_index :mostsmallbattleeffectinventories, :mostsmallmob_id
    add_index :mostsmallbattleeffectinventories, :mostsmalleffect_id
  end
end
