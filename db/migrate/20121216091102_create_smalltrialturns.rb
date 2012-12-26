class CreateSmalltrialturns < ActiveRecord::Migration
  def change
    create_table :smalltrialturns do |t|
      t.string :log

      t.timestamps
    end
  end
end
