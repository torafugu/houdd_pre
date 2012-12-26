class RemoveIsCompletedSmalltrials < ActiveRecord::Migration
  def change
    remove_column :smalltrials, :is_completed
  end
end
