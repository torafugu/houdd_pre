class RemoveMoretinymobtrailrecords < ActiveRecord::Migration
  def change
    drop_table :moretinymobtrailrecords
  end
end
