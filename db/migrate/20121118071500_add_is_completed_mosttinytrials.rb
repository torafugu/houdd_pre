class AddIsCompletedMosttinytrials < ActiveRecord::Migration
  def up
    add_column :mosttinytrials, :is_completed, :boolean
  end

  def down
    remove_column :mosttinytrials, :is_completed
  end
end
