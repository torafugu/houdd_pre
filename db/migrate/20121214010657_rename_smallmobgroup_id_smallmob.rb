class RenameSmallmobgroupIdSmallmob < ActiveRecord::Migration
  def change
    rename_column(:smallmobs, :smallmobgroup_id, :smallmobsquad_id)
    remove_index :smallmobs, :smallmobgroup_id
    add_index :smallmobs, :smallmobsquad_id
  end
end
