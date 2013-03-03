class CreateMostsmallresearchlvls < ActiveRecord::Migration
  def change
    create_table :mostsmallresearchlvls do |t|
      t.references :mostsmalluser
      t.references :mostsmallresearch
      t.integer :level
      t.integer :rp

      t.timestamps
    end
    add_index :mostsmallresearchlvls, :mostsmalluser_id
    add_index :mostsmallresearchlvls, :mostsmallresearch_id
  end
end
