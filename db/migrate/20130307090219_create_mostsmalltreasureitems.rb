class CreateMostsmalltreasureitems < ActiveRecord::Migration
  def change
    create_table :mostsmalltreasureitems do |t|
      t.references :mostsmalltreasurechest
      t.references :mostsmallitem
      t.boolean :is_identified

      t.timestamps
    end
    add_index :mostsmalltreasureitems, :mostsmalltreasurechest_id
    add_index :mostsmalltreasureitems, :mostsmallitem_id
  end
end
