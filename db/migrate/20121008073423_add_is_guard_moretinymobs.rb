class AddIsGuardMoretinymobs < ActiveRecord::Migration
  def up
    add_column :moretinymobs, :is_guard, :boolean
  end

  def down
    remove_column :moretinymobs, :is_guard
  end
end
