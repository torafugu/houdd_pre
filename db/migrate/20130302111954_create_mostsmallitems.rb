class CreateMostsmallitems < ActiveRecord::Migration
  def change
    create_table :mostsmallitems do |t|
      t.references :mostsmalliteminfo
      t.references :mostsmalluser
      t.integer :dp
      t.integer :quality
      t.integer :remaining_period

      t.timestamps
    end
    add_index :mostsmallitems, :mostsmalliteminfo_id
    add_index :mostsmallitems, :mostsmalluser_id
  end
end
