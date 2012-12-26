class CreateSmalltrialmoblineups < ActiveRecord::Migration
  def change
    create_table :smalltrialmoblineups do |t|
      t.references :smalltrial
      t.integer :squad_id
      t.string :squad_name
      t.integer :mob_id
      t.string :mob_name

      t.timestamps
    end
    add_index :smalltrialmoblineups, :smalltrial_id
  end
end
