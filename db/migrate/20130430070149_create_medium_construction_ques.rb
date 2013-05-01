class CreateMediumConstructionQues < ActiveRecord::Migration
  def change
    create_table :medium_construction_ques do |t|
      t.references :medium_construction
      t.references :medium_map_cell

      t.timestamps
    end
    add_index :medium_construction_ques, :medium_construction_id
    add_index :medium_construction_ques, :medium_map_cell_id
  end
end
