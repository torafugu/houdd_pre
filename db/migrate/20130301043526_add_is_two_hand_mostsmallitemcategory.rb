class AddIsTwoHandMostsmallitemcategory < ActiveRecord::Migration
  def change
    add_column :mostsmallitemcategories, :is_two_hand, :boolean
  end
end
