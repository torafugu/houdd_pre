class AddNaturalDeathFlgMediumMob < ActiveRecord::Migration
  def change
    add_column :medium_mobs, :natural_death_flg, :boolean
  end
end
