class AddNameSmallmobgroup < ActiveRecord::Migration
  def change
    add_column :smallmobgroups, :name, :string
  end
end
