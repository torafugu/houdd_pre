class CreateMediumItemInfos < ActiveRecord::Migration
  def change
    create_table :medium_item_infos do |t|
      t.string :item_category_sym
      t.integer :weight_level
      t.references :medium_body_part
      t.integer :size
      t.string :name
      t.integer :max_dp
      t.integer :phys_def
      t.integer :skill_def
      t.references :medium_atk_info
      t.references :medium_status_mod
      t.integer :prod_point

      t.timestamps
    end
    add_index :medium_item_infos, :medium_body_part_id
    add_index :medium_item_infos, :medium_atk_info_id
    add_index :medium_item_infos, :medium_status_mod_id
  end
end
