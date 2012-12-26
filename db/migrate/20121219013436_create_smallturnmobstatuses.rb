class CreateSmallturnmobstatuses < ActiveRecord::Migration
  def change
    create_table :smallturnmobstatuses do |t|
      t.references :smalltrialturn
      t.integer :mob_id
      t.integer :start_hp
      t.integer :end_hp
      t.integer :start_mp
      t.integer :end_mp
      t.text :status

      t.timestamps
    end
    add_index :smallturnmobstatuses, :smalltrialturn_id
  end
end
