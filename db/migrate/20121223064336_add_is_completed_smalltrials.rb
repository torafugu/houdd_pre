class AddIsCompletedSmalltrials < ActiveRecord::Migration
  def change
    add_column :smalltrials, :is_completed, :boolean
  end
end
