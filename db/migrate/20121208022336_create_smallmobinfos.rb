class CreateSmallmobinfos < ActiveRecord::Migration
  def change
    create_table :smallmobinfos do |t|
      t.string :name
      t.integer :category
      t.integer :max_hp
      t.integer :max_mp
      t.integer :high_atk
      t.integer :low_atk
      t.integer :def
      t.integer :agi

      t.timestamps
    end
  end
end
