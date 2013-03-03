class CreateMostsmalljobs < ActiveRecord::Migration
  def change
    create_table :mostsmalljobs do |t|
      t.string :name
      t.float :growth_mod
      t.integer :wepon_lvl
      t.integer :armor_lvl

      t.timestamps
    end
  end
end
