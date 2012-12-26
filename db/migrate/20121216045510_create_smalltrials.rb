class CreateSmalltrials < ActiveRecord::Migration
  def change
    create_table :smalltrials do |t|
      t.references :smallmap
      t.integer :def_mobunit_id
      t.integer :atk_mobunit_id
      t.references :smalltrialstatus

      t.timestamps
    end
    add_index :smalltrials, :smallmap_id
    add_index :smalltrials, :smalltrialstatus_id
  end
end
