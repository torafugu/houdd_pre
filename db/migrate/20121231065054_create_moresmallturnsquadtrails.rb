class CreateMoresmallturnsquadtrails < ActiveRecord::Migration
  def change
    create_table :moresmallturnsquadtrails do |t|
      t.references :moresmalltrialturn
      t.integer :squad_id
      t.integer :from_x
      t.integer :from_y
      t.integer :to_x
      t.integer :to_y
      t.text :trail
      t.boolean :is_annihilated

      t.timestamps
    end
    add_index :moresmallturnsquadtrails, :moresmalltrialturn_id
  end
end
