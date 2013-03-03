class CreateMostsmallsquads < ActiveRecord::Migration
  def change
    create_table :mostsmallsquads do |t|
      t.references :mostsmalluser
      t.references :mostsmallterritory
      t.string :name

      t.timestamps
    end
    add_index :mostsmallsquads, :mostsmalluser_id
    add_index :mostsmallsquads, :mostsmallterritory_id
  end
end
