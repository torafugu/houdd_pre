class RemoveIsAssignedSmallmob < ActiveRecord::Migration
  def change
    remove_column :smallmobs, :is_assigned
  end
end
