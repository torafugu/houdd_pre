class CreateMostsmallmobspecies < ActiveRecord::Migration
  def change
    create_table :mostsmallmobspecies do |t|
      t.string :name
      t.integer :prolificacy
      t.integer :longevity
      t.float :cost

      t.timestamps
    end
  end
end
