class CreateMosttinymobtrails < ActiveRecord::Migration
  def change
    create_table :mosttinymobtrails do |t|
      t.references :mosttinyturn
      t.references :mosttinymob
      t.text :trail

      t.timestamps
    end
    add_index :mosttinymobtrails, :mosttinyturn_id
    add_index :mosttinymobtrails, :mosttinymob_id
  end
end
