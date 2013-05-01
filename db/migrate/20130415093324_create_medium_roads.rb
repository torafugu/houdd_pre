class CreateMediumRoads < ActiveRecord::Migration
  def change
    create_table :medium_roads do |t|
      t.integer :start_map_id
      t.integer :end_map_id
      t.integer :distance
      t.integer :level

      t.timestamps
    end
  end
end
