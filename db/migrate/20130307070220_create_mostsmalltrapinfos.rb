class CreateMostsmalltrapinfos < ActiveRecord::Migration
  def change
    create_table :mostsmalltrapinfos do |t|
      t.string :name
      t.integer :const_period
      t.references :mostsmallelement
      t.integer :max_dp
      t.integer :disarm_diff
      t.integer :num_of_tgt
      t.integer :damage

      t.timestamps
    end
    add_index :mostsmalltrapinfos, :mostsmallelement_id
  end
end
