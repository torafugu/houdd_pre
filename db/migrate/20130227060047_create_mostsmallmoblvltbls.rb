class CreateMostsmallmoblvltbls < ActiveRecord::Migration
  def change
    create_table :mostsmallmoblvltbls do |t|
      t.references :mostsmallmobspecie
      t.integer :level
      t.integer :exp
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
    add_index :mostsmallmoblvltbls, :mostsmallmobspecie_id
  end
end
