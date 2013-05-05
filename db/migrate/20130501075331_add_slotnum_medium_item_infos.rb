class AddSlotnumMediumItemInfos < ActiveRecord::Migration
  def change
    add_column :medium_item_infos, :slot_num, :integer
  end
end
