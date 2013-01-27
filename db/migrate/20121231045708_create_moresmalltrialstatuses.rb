class CreateMoresmalltrialstatuses < ActiveRecord::Migration
  def change
    create_table :moresmalltrialstatuses do |t|
      t.string :name

      t.timestamps
    end
  end
end
