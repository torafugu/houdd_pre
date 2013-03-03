class CreateMostsmallelements < ActiveRecord::Migration
  def change
    create_table :mostsmallelements do |t|
      t.string :name

      t.timestamps
    end
  end
end
