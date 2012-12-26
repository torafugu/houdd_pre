class CreateSmallturnsquadtrails < ActiveRecord::Migration
  def change
    create_table :smallturnsquadtrails do |t|
      t.references :smalltrialturn
      t.integer :squad_id
      t.integer :from_x
      t.integer :from_y
      t.integer :to_x
      t.integer :to_y
      t.text :trail

      t.timestamps
    end
    add_index :smallturnsquadtrails, :smalltrialturn_id
  end
end
