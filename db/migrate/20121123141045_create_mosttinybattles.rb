class CreateMosttinybattles < ActiveRecord::Migration
  def change
    create_table :mosttinybattles do |t|
      t.references :mosttinyturn
      t.integer :src_mob_id
      t.integer :tgt_mob_id
      t.integer :damage_to_tgt
      t.text :log

      t.timestamps
    end
    add_index :mosttinybattles, :mosttinyturn_id
  end
end
