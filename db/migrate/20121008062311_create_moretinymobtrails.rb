class CreateMoretinymobtrails < ActiveRecord::Migration
  def change
    create_table :moretinymobtrails do |t|
      t.integer :moretinymob_id
      t.text :trail

      t.timestamps
    end
  end
end
