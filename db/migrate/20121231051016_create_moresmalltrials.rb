class CreateMoresmalltrials < ActiveRecord::Migration
  def change
    create_table :moresmalltrials do |t|
      t.references :moresmallmap
      t.integer :def_mobunit_id
      t.string :def_mobunit_name
      t.integer :atk_mobunit_id
      t.string :atk_mobunit_name
      t.references :moresmalltrialstatus

      t.timestamps
    end
    add_index :moresmalltrials, :moresmallmap_id
    add_index :moresmalltrials, :moresmalltrialstatus_id
  end
end
