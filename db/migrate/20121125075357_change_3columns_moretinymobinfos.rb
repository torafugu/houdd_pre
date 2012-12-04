class Change3columnsMoretinymobinfos < ActiveRecord::Migration
  def up
    remove_column :mosttinymobinfos, :str
    add_column :mosttinymobinfos, :high_atk, :integer
    add_column :mosttinymobinfos, :low_atk, :integer
  end

  def down
    add_column :mosttinymobinfos, :str, :integer
    remove_column :mosttinymobinfos, :high_atk
    remove_column :mosttinymobinfos, :low_atk
  end
end
