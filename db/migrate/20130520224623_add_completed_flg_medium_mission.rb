class AddCompletedFlgMediumMission < ActiveRecord::Migration
  def change
    add_column :medium_missions, :completed_flg, :boolean
  end
end
