class CreateMediumMaps < ActiveRecord::Migration
  def change
    create_table :medium_maps do |t|
      t.references :medium_houdd_user
      t.string :name
      t.boolean :exclusive_flg

      t.timestamps
    end
    add_index :medium_maps, :medium_houdd_user_id
  end
end
