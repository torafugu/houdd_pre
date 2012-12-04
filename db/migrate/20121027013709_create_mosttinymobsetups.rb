class CreateMosttinymobsetups < ActiveRecord::Migration
  def change
    create_table :mosttinymobsetups do |t|
      t.references :mosttinymobinventory
      t.references :mosttinymob
      t.integer :start_x
      t.integer :start_y
      t.integer :distance
      t.boolean :is_guard

      t.timestamps
    end
    add_index :mosttinymobsetups, :mosttinymobinventory_id
    add_index :mosttinymobsetups, :mosttinymob_id
  end
end
