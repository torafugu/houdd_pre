class CreateMostsmallmobs < ActiveRecord::Migration
  def change
    create_table :mostsmallmobs do |t|
      t.references :mostsmallmobgene
      t.integer :level
      t.references :mostsmalljob
      t.integer :job_level
      t.references :mostsmalluser
      t.references :mostsmallsquad
      t.string :name
      t.boolean :gender
      t.integer :age
      t.integer :max_hp
      t.integer :max_sp
      t.integer :hp
      t.integer :sp
      t.integer :str
      t.integer :dex
      t.integer :con
      t.integer :int
      t.integer :wis
      t.integer :cha
      t.float :battle_exp
      t.float :job_exp

      t.timestamps
    end
    add_index :mostsmallmobs, :mostsmallmobgene_id
    add_index :mostsmallmobs, :mostsmalljob_id
    add_index :mostsmallmobs, :mostsmalluser_id
    add_index :mostsmallmobs, :mostsmallsquad_id
  end
end
