class CreateMostsmalltrapinfos < ActiveRecord::Migration
  def change
    create_table :mostsmalltrapinfos do |t|
      t.string :name
      t.integer :const_period

      t.timestamps
    end
  end
end
