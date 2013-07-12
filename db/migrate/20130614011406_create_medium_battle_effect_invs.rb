class CreateMediumBattleEffectInvs < ActiveRecord::Migration
  def change
    create_table :medium_battle_effect_invs do |t|
      t.references :medium_mob
      t.references :medium_status_mod
      t.integer :caused_mob_id
      t.integer :rmng_duration

      t.timestamps
    end
    add_index :medium_battle_effect_invs, :medium_mob_id
    add_index :medium_battle_effect_invs, :medium_status_mod_id
  end
end
