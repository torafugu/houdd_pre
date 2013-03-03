class CreateMostsmallconstproducts < ActiveRecord::Migration
  def change
    create_table :mostsmallconstproducts do |t|
      t.references :mostsmallconstructioninfo
      t.integer :level
      t.references :mostsmallresource
      t.integer :amount

      t.timestamps
    end
    add_index :mostsmallconstproducts, :mostsmallconstructioninfo_id
    add_index :mostsmallconstproducts, :mostsmallresource_id
  end
end
