class CreateMediumItemManufactureQues < ActiveRecord::Migration
  def change
    create_table :medium_item_manufacture_ques do |t|
      t.references :medium_houdd_user
      t.references :medium_item_info

      t.timestamps
    end
    add_index :medium_item_manufacture_ques, :medium_houdd_user_id
    add_index :medium_item_manufacture_ques, :medium_item_info_id
  end
end
