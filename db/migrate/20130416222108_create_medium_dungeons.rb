class CreateMediumDungeons < ActiveRecord::Migration
  def change
    create_table :medium_dungeons do |t|
      t.references :medium_map_cell
      t.string :type_sym
      t.string :name

      t.timestamps
    end
    add_index :medium_dungeons, :medium_map_cell_id
  end
end
