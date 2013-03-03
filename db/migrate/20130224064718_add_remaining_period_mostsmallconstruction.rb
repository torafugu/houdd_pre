class AddRemainingPeriodMostsmallconstruction < ActiveRecord::Migration
  def change
    add_column :mostsmallconstructions, :remaining_period, :integer
  end
end
