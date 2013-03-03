class CreateMostsmallroads < ActiveRecord::Migration
  def change
    create_table :mostsmallroads do |t|
      t.integer :start_territory_id
      t.integer :dest_territory_id
      t.integer :distance
      t.integer :level

      t.timestamps
    end
  end
end
