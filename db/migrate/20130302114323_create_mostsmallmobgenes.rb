class CreateMostsmallmobgenes < ActiveRecord::Migration
  def change
    create_table :mostsmallmobgenes do |t|
      t.references :mostsmallmobspecie
      t.integer :mothermobgene_id
      t.integer :fathermobgene_id
      t.string :name
      t.float :phys_mod
      t.float :int_mod
      t.float :prolificacy_mod
      t.float :longevity_mod
      t.float :cost_mod
      t.float :growth_mod

      t.timestamps
    end
    add_index :mostsmallmobgenes, :mostsmallmobspecie_id
  end
end
