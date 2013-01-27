class CreateMoresmallturnbattlelogs < ActiveRecord::Migration
  def change
    create_table :moresmallturnbattlelogs do |t|
      t.references :moresmallbattleturn
      t.integer :src_mob_id
      t.integer :tgt_mob_id
      t.integer :damage
      t.integer :effect_id
      t.text :log

      t.timestamps
    end
    add_index :moresmallturnbattlelogs, :moresmallbattleturn_id
  end
end
