class RenamePrevIdMosttinymap < ActiveRecord::Migration
  def change
    rename_column(:mosttinymaps, :prev_id, :prev_map_id)
  end
end
