class CreateMediumFamilies < ActiveRecord::Migration
  def change
    create_table :medium_families do |t|
      t.string :name
      t.string :ability_sym

      t.timestamps
    end
  end
end
