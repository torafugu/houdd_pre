class ModifyMediumItemEquipInv < ActiveRecord::Migration
  def change
    remove_index :medium_item_equip_invs, :medium_body_part_inv_id
    remove_column :medium_item_equip_invs, :medium_body_part_inv_id
    add_column :medium_item_equip_invs, :medium_body_part_id, :integer
    add_index :medium_item_equip_invs, :medium_body_part_id
  end
end
