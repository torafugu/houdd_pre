class CreateMostsmallitemequipinventories < ActiveRecord::Migration
  def change
    create_table :mostsmallitemequipinventories do |t|
      t.references :mostsmallitem
      t.references :mostsmallmob
      t.references :mostsmallequipslot

      t.timestamps
    end
    add_index :mostsmallitemequipinventories, :mostsmallitem_id
    add_index :mostsmallitemequipinventories, :mostsmallmob_id
    add_index :mostsmallitemequipinventories, :mostsmallequipslot_id
  end
end
