class AddNumOfTgtMediumItemInfo < ActiveRecord::Migration
  def change
    add_column :medium_item_infos, :num_of_tgt, :integer
  end
end
