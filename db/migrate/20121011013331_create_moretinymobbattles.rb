class CreateMoretinymobbattles < ActiveRecord::Migration
  def change
    create_table :moretinymobbattles do |t|
      t.references :moretinymobtrail
      t.integer :trail_step
      t.text :log
      t.integer :tgt_mob_id
      t.integer :damage

      t.timestamps
    end
    add_index :moretinymobbattles, :moretinymobtrail_id
  end
end
