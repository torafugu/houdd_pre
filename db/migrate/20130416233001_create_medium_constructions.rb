class CreateMediumConstructions < ActiveRecord::Migration
  def change
    create_table :medium_constructions do |t|
      t.string :symbol
      t.string :name
      t.integer :food
      t.integer :production
      t.integer :money
      t.integer :prod_point

      t.timestamps
    end
  end
end
