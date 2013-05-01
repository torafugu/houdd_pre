class CreateMediumTerrains < ActiveRecord::Migration
  def change
    create_table :medium_terrains do |t|
      t.string :symbol
      t.string :name
      t.integer :food
      t.integer :production
      t.integer :money
      t.integer :freq_rate
      t.integer :continuity_mod

      t.timestamps
    end
  end
end
