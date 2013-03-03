class CreateMostsmallterrainproducts < ActiveRecord::Migration
  def change
    create_table :mostsmallterrainproducts do |t|
      t.references :mostsmallterrain
      t.references :mostsmallresource
      t.integer :amount

      t.timestamps
    end
    add_index :mostsmallterrainproducts, :mostsmallterrain_id
    add_index :mostsmallterrainproducts, :mostsmallresource_id
  end
end
