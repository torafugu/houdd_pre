class CreateMoresmallmobinfos < ActiveRecord::Migration
  def change
    create_table :moresmallmobinfos do |t|
      t.string :name
      t.integer :category_id
      t.integer :max_hp
      t.integer :max_mp
      t.integer :str
      t.integer :dex
      t.integer :int
      t.integer :wis

      t.timestamps
    end
  end
end
