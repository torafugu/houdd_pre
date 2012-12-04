class Change3columnsMosttinymobsetups < ActiveRecord::Migration
  def up
    remove_index :mosttinymobsetups, :mosttinymobinventory_id
    remove_column :mosttinymobsetups, :mosttinymobinventory_id
    add_column :mosttinymobsetups, :mosttinytrial_id, :integer
    add_index :mosttinymobsetups, :mosttinytrial_id
  end

  def down
    add_index :mosttinymobsetups, :mosttinymobinventory_id
    add_column :mosttinymobsetups, :mosttinymobinventory_id, :integer
    remove_column :mosttinymobsetups, :mosttinytrial_id
    remove_index :mosttinymobsetups, :mosttinytrial_id
  end
end
