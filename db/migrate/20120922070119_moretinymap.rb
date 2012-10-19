class Moretinymap < ActiveRecord::Migration
  def up
    add_column :moretinymaps, :category, :integer
  end

  def down
    remove_column :moretinymaps, :category
  end
end
