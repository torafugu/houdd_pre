class AddNecPointMediumConstructionQues < ActiveRecord::Migration
  def change
    add_column :medium_construction_ques, :nec_point, :integer
  end
end
