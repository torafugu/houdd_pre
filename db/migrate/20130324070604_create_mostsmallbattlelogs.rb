class CreateMostsmallbattlelogs < ActiveRecord::Migration
  def change
    create_table :mostsmallbattlelogs do |t|
      t.references :mostsmallbattleturn
      t.integer :atk_mob_id
      t.integer :atk_mob_vpos
      t.integer :def_mob_id
      t.integer :def_mob_vpos
      t.boolean :is_def_mob_dead
      t.string :damage_cause
      t.integer :damage
      t.integer :effect_id
      t.text :log

      t.timestamps
    end
    add_index :mostsmallbattlelogs, :mostsmallbattleturn_id
  end
end
