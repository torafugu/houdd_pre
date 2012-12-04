class Change5columnsMosttinymobtrails < ActiveRecord::Migration
  def up
    add_column :mosttinymobtrails, :from_x, :integer
    add_column :mosttinymobtrails, :from_y, :integer
    add_column :mosttinymobtrails, :to_x, :integer
    add_column :mosttinymobtrails, :to_y, :integer
  end

  def down
    remove_column :mosttinytrials, :from_x
    remove_column :mosttinytrials, :from_y
    remove_column :mosttinytrials, :to_x
    remove_column :mosttinytrials, :to_y
  end
end
