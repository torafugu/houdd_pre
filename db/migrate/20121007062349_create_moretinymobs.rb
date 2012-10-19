class CreateMoretinymobs < ActiveRecord::Migration
  def change
    create_table :moretinymobs do |t|
      t.string :name
      t.integer :moretinymobinfo_id
      t.integer :moretinymap_id
      t.integer :x
      t.integer :y

      t.timestamps
    end
  add_index "moretinymobs", ["moretinymap_id"], :name => "index_moretinymobs_on_moretinymap_id"
  add_index "moretinymobs", ["moretinymobinfo_id"], :name => "index_moretinymobs_on_moretinymobinfo_id"
  end
end
