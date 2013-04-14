class CreateMostsmallsquadtrails < ActiveRecord::Migration
  def change
    create_table :mostsmallsquadtrails do |t|
      t.references :mostsmalltrialturn
      t.integer :squad_id
      t.integer :from_x
      t.integer :from_y
      t.integer :to_x
      t.integer :to_y
      t.text :trail
      t.boolean :is_annihilated

      t.timestamps
    end
    add_index :mostsmallsquadtrails, :mostsmalltrialturn_id
  end
end
