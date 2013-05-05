class AddAllotments2MediumHouddUser < ActiveRecord::Migration
  def change
    add_column :medium_houdd_users, :allot_for_item, :integer
    add_column :medium_houdd_users, :allot_for_const, :integer
    add_column :medium_houdd_users, :allot_for_research, :integer
  end
end
