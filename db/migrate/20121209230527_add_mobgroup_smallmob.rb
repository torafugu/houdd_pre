class AddMobgroupSmallmob < ActiveRecord::Migration
  def change
    add_column :smallmobs, :smallmobgroup_id, :integer
    add_index :smallmobs, :smallmobgroup_id
  end
end
