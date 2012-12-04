class AddIsCompleleMosttinymobs < ActiveRecord::Migration
  def up
    add_column :mosttinymobs, :is_assigned, :boolean
  end

  def down
    remove_column :mosttinymobs, :is_assigned
  end
end
