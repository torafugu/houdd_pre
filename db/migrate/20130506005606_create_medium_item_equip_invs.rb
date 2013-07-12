class CreateMediumItemEquipInvs < ActiveRecord::Migration
  def change
    create_table :medium_item_equip_invs do |t|
      t.references :medium_item
      t.references :medium_mob
      t.references :medium_body_part_inv

      t.timestamps
    end
    add_index :medium_item_equip_invs, :medium_item_id
    add_index :medium_item_equip_invs, :medium_mob_id
    add_index :medium_item_equip_invs, :medium_body_part_inv_id
  end
end
