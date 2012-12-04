class AddTgtXyMosttinybattles < ActiveRecord::Migration
  def up
    add_column :mosttinybattles, :tgt_mob_x, :integer
    add_column :mosttinybattles, :tgt_mob_y, :integer
  end

  def down
    remove_column :mosttinybattles, :tgt_mob_x
    remove_column :mosttinybattles, :tgt_mob_y
  end
end
