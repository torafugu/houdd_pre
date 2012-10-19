class AddDistanceMoretinymobs < ActiveRecord::Migration
  def up
  end
    add_column :moretinymobs, :distance, :integer
  def down
    remove_column :moretinymobs, :distance
  end
end
