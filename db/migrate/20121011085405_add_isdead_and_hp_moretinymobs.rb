class AddIsdeadAndHpMoretinymobs < ActiveRecord::Migration
  def up
    add_column :moretinymobs, :is_dead, :boolean
    add_column :moretinymobs, :hp, :integer
  end

  def down
    remove_column :moretinymobs, :is_dead
    remove_column :moretinymobs, :hp
  end
end
