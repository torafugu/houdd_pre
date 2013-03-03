class CreateMostsmallresearchlvltbls < ActiveRecord::Migration
  def change
    create_table :mostsmallresearchlvltbls do |t|
      t.references :mostsmallresearch
      t.integer :level
      t.integer :rp
      t.integer :keep_rp

      t.timestamps
    end
    add_index :mostsmallresearchlvltbls, :mostsmallresearch_id
  end
end
