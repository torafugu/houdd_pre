class ChangecolumnnameXyMoretinymobs < ActiveRecord::Migration
  def change
    rename_column(:moretinymobs, :x, :start_x)
    rename_column(:moretinymobs, :y, :start_y)
  end
end
