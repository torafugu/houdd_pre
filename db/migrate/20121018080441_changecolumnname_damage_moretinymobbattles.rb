class ChangecolumnnameDamageMoretinymobbattles < ActiveRecord::Migration
  def change
    rename_column(:moretinymobbattles, :damage, :damage_to_me)
  end
end
