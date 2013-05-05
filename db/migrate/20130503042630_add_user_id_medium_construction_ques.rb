class AddUserIdMediumConstructionQues < ActiveRecord::Migration
  def change
    add_column :medium_construction_ques, :medium_houdd_user_id, :integer
    add_index :medium_construction_ques, :medium_houdd_user_id
  end
end
