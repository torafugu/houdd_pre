class CreateMediumResources < ActiveRecord::Migration
  def change
    drop_table :medium_resources
    create_table :medium_resources do |t|
      t.string :symbol
      t.string :name
      t.references :medium_terrain
      t.integer :freq_rate

      t.timestamps
    end
    add_index :medium_resources, :medium_terrain_id
  end
end
