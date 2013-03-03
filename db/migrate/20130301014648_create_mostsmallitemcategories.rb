class CreateMostsmallitemcategories < ActiveRecord::Migration
  def change
    create_table :mostsmallitemcategories do |t|
      t.references :mostsmallequipslot
      t.string :name
      t.integer :wepon_level
      t.integer :armor_level

      t.timestamps
    end
    add_index :mostsmallitemcategories, :mostsmallequipslot_id
  end
end
