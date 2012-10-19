class AddDmgToTgtMoretinymobbattles < ActiveRecord::Migration
  def up
  end
    add_column :moretinymobbattles, :damage_to_tgt, :integer
  def down
    remove_column :moretinymobbattles, :damage_to_tgt
  end
end
