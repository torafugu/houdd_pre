class Remove4columnsMosttinymob < ActiveRecord::Migration
  def up
    remove_column :mosttinymobs, :is_guard
    remove_column :mosttinymobs, :start_x
    remove_column :mosttinymobs, :start_y
    remove_column :mosttinymobs, :distance
  end

  def down
    add_column :mosttinymobs, :is_guard, :boolean
    add_column :mosttinymobs, :start_x, :integer
    add_column :mosttinymobs, :start_y, :integer
    add_column :mosttinymobs, :distance, :integer
  end
end
