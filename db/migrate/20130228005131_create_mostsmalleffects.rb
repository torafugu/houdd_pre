class CreateMostsmalleffects < ActiveRecord::Migration
  def change
    create_table :mostsmalleffects do |t|
      t.string :name
      t.integer :damage
      t.integer :ac
      t.integer :sp_mod
      t.integer :str_mod
      t.integer :dex_mod
      t.integer :con_mod
      t.integer :int_mod
      t.integer :wis_mod
      t.integer :cha_mod
      t.integer :duration

      t.timestamps
    end
  end
end
