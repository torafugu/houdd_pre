class CreateMosttinyturns < ActiveRecord::Migration
  def change
    create_table :mosttinyturns do |t|
      t.references :mosttinytrial

      t.timestamps
    end
    add_index :mosttinyturns, :mosttinytrial_id
  end
end
