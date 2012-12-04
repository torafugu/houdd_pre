class AddLogMosttinyturns < ActiveRecord::Migration
  def up
    add_column :mosttinyturns, :log, :text
  end

  def down
    remove_column :mosttinyturns, :log
  end
end
