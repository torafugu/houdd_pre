class CreateMoresmalltrialturns < ActiveRecord::Migration
  def change
    create_table :moresmalltrialturns do |t|
      t.references :moresmalltrial
      t.string :log

      t.timestamps
    end
    add_index :moresmalltrialturns, :moresmalltrial_id
  end
end
