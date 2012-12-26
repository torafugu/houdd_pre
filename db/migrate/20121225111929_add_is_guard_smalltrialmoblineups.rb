class AddIsGuardSmalltrialmoblineups < ActiveRecord::Migration
  def change
    add_column :smalltrialmoblineups, :is_completed, :boolean
  end
end
