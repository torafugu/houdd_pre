class CreateSmallmobunits < ActiveRecord::Migration
  def change
    create_table :smallmobunits do |t|
      t.references :smalluser
      t.string :name
      t.references :smallstrategy
      t.boolean :is_guard
      t.references :smallmap
      t.boolean :is_prepared

      t.timestamps
    end
    add_index :smallmobunits, :smalluser_id
    add_index :smallmobunits, :smallstrategy_id
    add_index :smallmobunits, :smallmap_id
  end
end
