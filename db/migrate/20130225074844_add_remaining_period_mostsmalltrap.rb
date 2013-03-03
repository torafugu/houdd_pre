class AddRemainingPeriodMostsmalltrap < ActiveRecord::Migration
  def change
    add_column :mostsmalltraps, :remaining_period, :integer
  end
end
