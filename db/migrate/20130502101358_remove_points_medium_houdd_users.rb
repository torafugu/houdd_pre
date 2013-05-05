class RemovePointsMediumHouddUsers < ActiveRecord::Migration
  def change
    remove_column :medium_houdd_users, :wepon_lvl
    remove_column :medium_houdd_users, :armor_lvl
    remove_column :medium_houdd_users, :potion_lvl
    remove_column :medium_houdd_users, :trap_lvl
    remove_column :medium_houdd_users, :skill_lvl
    remove_column :medium_houdd_users, :allot_for_item
    remove_column :medium_houdd_users, :next_item_id
    remove_column :medium_houdd_users, :prod_for_item
    remove_column :medium_houdd_users, :next_const_id
    remove_column :medium_houdd_users, :prod_for_const
    remove_column :medium_houdd_users, :allot_for_const
    remove_column :medium_houdd_users, :next_research_sym
    remove_column :medium_houdd_users, :prod_for_research
    remove_column :medium_houdd_users, :allot_for_research
  end
end
