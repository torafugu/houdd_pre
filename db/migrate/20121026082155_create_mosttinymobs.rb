class CreateMosttinymobs < ActiveRecord::Migration
  def change
    create_table :mosttinymobs do |t|
      t.string :name
      t.references :mosttinyuser
      t.references :mosttinymobinfo
      t.boolean :is_guard
      t.integer :start_x
      t.integer :start_y
      t.integer :distance
      t.integer :hp
      t.boolean :is_dead

      t.timestamps
    end
    add_index :mosttinymobs, :mosttinyuser_id
    add_index :mosttinymobs, :mosttinymobinfo_id
  end
end
