class RemoveSpModMostsmalleffects < ActiveRecord::Migration
  def change
    remove_column :mostsmalleffects, :sp_mod
  end
end
