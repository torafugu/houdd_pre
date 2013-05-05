class CreateMediumItems < ActiveRecord::Migration
  def change
    create_table :medium_items do |t|
      t.references :medium_item_info
      t.references :medium_houdd_user
      t.integer :dp
      t.integer :quality

      t.timestamps
    end
    add_index :medium_items, :medium_item_info_id
    add_index :medium_items, :medium_houdd_user_id
  end
end
