class RenameCategorynSmallmobinfo < ActiveRecord::Migration
  def change
    rename_column(:smallmobinfos, :category, :category_id)
  end
end
