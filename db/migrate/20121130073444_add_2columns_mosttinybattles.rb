class Add2columnsMosttinybattles < ActiveRecord::Migration
  def up
    add_column :mosttinybattles, :tgt_mob_current_hp, :integer
    add_column :mosttinybattles, :is_tgt_mob_dead, :boolean
  end

  def down
    remove_column :mosttinybattles, :tgt_mob_current_hp
    remove_column :mosttinybattles, :is_tgt_mob_dead
  end
end
