class CreateMostsmallmobspecies < ActiveRecord::Migration
  def change
    create_table :mostsmallmobspecies do |t|
      t.string :name
      t.float :prolificacy
      t.float :longevity
      t.float :growth_mod
      t.float :cost
      t.integer :atk
      t.integer :ac
      t.integer :max_hp
      t.integer :max_sp
      t.integer :str
      t.integer :dex
      t.integer :con
      t.integer :int
      t.integer :wis
      t.integer :cha

      t.timestamps
    end
  end
end
