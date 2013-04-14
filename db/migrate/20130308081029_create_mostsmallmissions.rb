class CreateMostsmallmissions < ActiveRecord::Migration
  def change
    create_table :mostsmallmissions do |t|
      t.references :mostsmalluser
      t.references :mostsmallterritory
      t.references :mostsmallmissioncategory
      t.references :mostsmallstrategy
      t.integer :priority
      t.integer :remaining_period

      t.timestamps
    end
    add_index :mostsmallmissions, :mostsmalluser_id
    add_index :mostsmallmissions, :mostsmallterritory_id
    add_index :mostsmallmissions, :mostsmallmissioncategory_id
    add_index :mostsmallmissions, :mostsmallstrategy_id
  end
end
