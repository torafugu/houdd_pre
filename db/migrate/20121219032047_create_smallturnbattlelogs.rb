class CreateSmallturnbattlelogs < ActiveRecord::Migration
  def change
    create_table :smallturnbattlelogs do |t|
      t.references :smalltrialturn
      t.integer :src_mob_id
      t.integer :tgt_mob_id
      t.integer :damage
      t.integer :effect_id
      t.text :log

      t.timestamps
    end
    add_index :smallturnbattlelogs, :smalltrialturn_id
  end
end
