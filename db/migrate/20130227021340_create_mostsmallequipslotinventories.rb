class CreateMostsmallequipslotinventories < ActiveRecord::Migration
  def change
    create_table :mostsmallequipslotinventories do |t|
      t.references :mostsmallequipslot
      t.references :mostsmallmobspecie

      t.timestamps
    end
    add_index :mostsmallequipslotinventories, :mostsmallequipslot_id
    add_index :mostsmallequipslotinventories, :mostsmallmobspecie_id
  end
end
