class CreateMediumTcItemInvs < ActiveRecord::Migration
  def change
    create_table :medium_tc_item_invs do |t|
      t.references :medium_dungeon_cell
      t.references :medium_item

      t.timestamps
    end
    add_index :medium_tc_item_invs, :medium_dungeon_cell_id
    add_index :medium_tc_item_invs, :medium_item_id
  end
end
