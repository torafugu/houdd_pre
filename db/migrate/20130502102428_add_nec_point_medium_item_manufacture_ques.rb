class AddNecPointMediumItemManufactureQues < ActiveRecord::Migration
  def change
    add_column :medium_item_manufacture_ques, :nec_point, :integer
  end
end
