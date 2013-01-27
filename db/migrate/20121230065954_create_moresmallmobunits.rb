class CreateMoresmallmobunits < ActiveRecord::Migration
  def change
    create_table :moresmallmobunits do |t|
      t.references :moresmalluser
      t.string :name
      t.references :moresmallstrategy
      t.integer :cur_map_id
      t.integer :tgt_map_id
      t.boolean :is_prepared

      t.timestamps
    end
    add_index :moresmallmobunits, :moresmalluser_id
    add_index :moresmallmobunits, :moresmallstrategy_id
  end
end
