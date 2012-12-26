class RemoveIsDeadSmallmobs < ActiveRecord::Migration
  def change
    remove_column :smallmobs, :is_dead
  end
end
