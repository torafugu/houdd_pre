class CreateMostsmalltreasurechests < ActiveRecord::Migration
  def change
    create_table :mostsmalltreasurechests do |t|
      t.references :mostsmallterritory
      t.integer :dungeon_x
      t.integer :dungeon_y
      t.boolean :is_opened

      t.timestamps
    end
    add_index :mostsmalltreasurechests, :mostsmallterritory_id
  end
end
