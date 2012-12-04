class AddCurrentXAndYMosttinymobsetups < ActiveRecord::Migration
  def up
    add_column :mosttinymobsetups, :current_x, :integer
    add_column :mosttinymobsetups, :current_y, :integer
  end

  def down
    remove_column :mosttinymobsetups, :current_x
    remove_column :mosttinymobsetups, :current_y
  end
end
