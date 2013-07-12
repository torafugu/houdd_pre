class AddHpModMediumStatusMod < ActiveRecord::Migration
  def change
    add_column :medium_status_mods, :hp_mod, :integer
  end
end
