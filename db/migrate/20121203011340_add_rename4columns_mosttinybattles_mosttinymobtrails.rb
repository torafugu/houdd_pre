class AddRename4columnsMosttinybattlesMosttinymobtrails < ActiveRecord::Migration
  def change
    rename_column(:mosttinybattles, :src_mob_id, :src_mobsetup_id)
    rename_column(:mosttinybattles, :tgt_mob_id, :tgt_mobsetup_id)
  end
end
