class DropSmalltrial < ActiveRecord::Migration
  def change
    drop_table :smalltrials
  end
end
