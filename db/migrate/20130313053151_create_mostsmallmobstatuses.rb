class CreateMostsmallmobstatuses < ActiveRecord::Migration
  def change
    create_table :mostsmallmobstatuses do |t|
      t.references :mostsmalltrialturn
      t.integer :mob_id
      t.integer :start_hp
      t.integer :end_hp
      t.integer :start_sp
      t.integer :end_sp
      t.string :start_status
      t.string :end_status

      t.timestamps
    end
    add_index :mostsmallmobstatuses, :mostsmalltrialturn_id
  end
end
