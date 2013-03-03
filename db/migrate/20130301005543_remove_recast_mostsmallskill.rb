class RemoveRecastMostsmallskill < ActiveRecord::Migration
  def change
    remove_column :mostsmallskills, :recast
  end
end
