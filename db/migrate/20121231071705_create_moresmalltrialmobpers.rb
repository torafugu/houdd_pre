class CreateMoresmalltrialmobpers < ActiveRecord::Migration
  def change
    create_table :moresmalltrialmobpers do |t|
      t.references :moresmalltrialsquadpers
      t.integer :mob_id
      t.string :mob_name
      t.integer :max_hp
      t.integer :max_mp
      t.integer :str
      t.integer :dex
      t.integer :int
      t.integer :wis

      t.timestamps
    end
    add_index :moresmalltrialmobpers, :moresmalltrialsquadpers_id
  end
end
