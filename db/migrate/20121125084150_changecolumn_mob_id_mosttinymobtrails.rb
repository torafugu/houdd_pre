class ChangecolumnMobIdMosttinymobtrails < ActiveRecord::Migration
  def up
    remove_index :mosttinymobtrails, :mosttinymob_id
    remove_column :mosttinymobtrails, :mosttinymob_id
    add_column :mosttinymobtrails, :mosttinymobsetup_id, :integer
    add_index :mosttinymobtrails, :mosttinymobsetup_id

  end

  def down
    add_column :mosttinymobtrails, :mosttinymob_id, :integer
    add_index :mosttinymobtrails, :mosttinymob_id
    remove_index :mosttinymobtrails, :mosttinymobsetup_id
    remove_column :mosttinymobtrails, :mosttinymobsetup_id
  end
end
