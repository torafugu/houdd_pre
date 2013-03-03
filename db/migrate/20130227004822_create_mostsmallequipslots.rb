class CreateMostsmallequipslots < ActiveRecord::Migration
  def change
    create_table :mostsmallequipslots do |t|
      t.string :name
      t.boolean :is_hand

      t.timestamps
    end
  end
end
