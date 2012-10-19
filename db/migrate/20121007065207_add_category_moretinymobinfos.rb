class AddCategoryMoretinymobinfos < ActiveRecord::Migration
  def up
    add_column :moretinymobinfos, :category, :integer
  end

  def down
    remove_column :moretinymobinfos, :category
  end
end
