class CreateMoretinymobinfos < ActiveRecord::Migration
  def change
    create_table :moretinymobinfos do |t|
      t.string :name
      t.integer :hp
      t.integer :str

      t.timestamps
    end
  end
end
