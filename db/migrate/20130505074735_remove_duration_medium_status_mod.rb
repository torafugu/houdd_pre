class RemoveDurationMediumStatusMod < ActiveRecord::Migration
  def change
    remove_column :medium_status_mods, :duration
  end
end
