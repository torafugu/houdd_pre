class CreateMostsmalliteminfos < ActiveRecord::Migration
  def change
    create_table :mostsmalliteminfos do |t|
      t.references :mostsmallitemcategory
      t.references :mostsmallelement
      t.references :mostsmallmobspecie
      t.string :name
      t.integer :num_of_tgt
      t.integer :accuracy
      t.integer :range
      t.integer :damage
      t.integer :ac
      t.integer :max_dp
      t.integer :const_period

      t.timestamps
    end
    add_index :mostsmalliteminfos, :mostsmallitemcategory_id
    add_index :mostsmalliteminfos, :mostsmallelement_id
    add_index :mostsmalliteminfos, :mostsmallmobspecie_id
  end
end
