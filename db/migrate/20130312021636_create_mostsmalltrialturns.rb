class CreateMostsmalltrialturns < ActiveRecord::Migration
  def change
    create_table :mostsmalltrialturns do |t|
      t.references :mostsmalltrial
      t.text :log

      t.timestamps
    end
    add_index :mostsmalltrialturns, :mostsmalltrial_id
  end
end
