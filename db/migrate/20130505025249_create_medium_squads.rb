class CreateMediumSquads < ActiveRecord::Migration
  def change
    create_table :medium_squads do |t|
      t.references :medium_houdd_user
      t.references :medium_map
      t.string :name

      t.timestamps
    end
    add_index :medium_squads, :medium_houdd_user_id
    add_index :medium_squads, :medium_map_id
  end
end
