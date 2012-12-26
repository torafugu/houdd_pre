class DropSmallmobgroupSmallmobgroupsetup < ActiveRecord::Migration
  def change
    drop_table :smallmobgroupsetups
    drop_table :smallmobgroups
  end
end
