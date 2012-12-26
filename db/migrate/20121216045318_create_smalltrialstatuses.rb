class CreateSmalltrialstatuses < ActiveRecord::Migration
  def change
    create_table :smalltrialstatuses do |t|
      t.string :name

      t.timestamps
    end
  end
end
