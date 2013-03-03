class AddIsExclusiveMostsmallterritory < ActiveRecord::Migration
  def change
    add_column :mostsmallterritories, :is_exclusive, :boolean
  end
end
