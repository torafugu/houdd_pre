class CreateMostsmallresstocks < ActiveRecord::Migration
  def change
    create_table :mostsmallresstocks do |t|
      t.references :mostsmalluser
      t.references :mostsmallresource
      t.integer :amount

      t.timestamps
    end
    add_index :mostsmallresstocks, :mostsmalluser_id
    add_index :mostsmallresstocks, :mostsmallresource_id
  end
end
