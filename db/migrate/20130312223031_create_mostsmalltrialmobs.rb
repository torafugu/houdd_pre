class CreateMostsmalltrialmobs < ActiveRecord::Migration
  def change
    create_table :mostsmalltrialmobs do |t|
      t.references :mostsmalltrialsquad
      t.integer :mob_id
      t.string :specie_name
      t.string :mob_name
      t.integer :max_hp
      t.integer :max_sp

      t.timestamps
    end
    add_index :mostsmalltrialmobs, :mostsmalltrialsquad_id
  end
end
