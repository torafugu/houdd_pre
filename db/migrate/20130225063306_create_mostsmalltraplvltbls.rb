class CreateMostsmalltraplvltbls < ActiveRecord::Migration
  def change
    create_table :mostsmalltraplvltbls do |t|
      t.references :mostsmalltrapinfo
      t.integer :level
      t.integer :max_dp
      t.integer :disarm_diff
      t.integer :num_of_tgt
      t.integer :damage

      t.timestamps
    end
    add_index :mostsmalltraplvltbls, :mostsmalltrapinfo_id
  end
end
