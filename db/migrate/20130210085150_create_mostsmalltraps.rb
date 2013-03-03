class CreateMostsmalltraps < ActiveRecord::Migration
  def change
    create_table :mostsmalltraps do |t|
      t.references :mostsmalltrapinfo
      t.references :mostsmallterritory
      t.integer :dungeon_x
      t.integer :dungeon_y
      t.integer :level
      t.integer :dp

      t.timestamps
    end
    add_index :mostsmalltraps, :mostsmalltrapinfo_id
    add_index :mostsmalltraps, :mostsmallterritory_id
  end
end
