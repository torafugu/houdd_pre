class CreateMostsmallterritories < ActiveRecord::Migration
  def change
    create_table :mostsmallterritories do |t|
      t.references :mostsmalluser
      t.string :name
      t.text :map_txt
      t.text :dungeon_txt

      t.timestamps
    end
    add_index :mostsmallterritories, :mostsmalluser_id
  end
end
