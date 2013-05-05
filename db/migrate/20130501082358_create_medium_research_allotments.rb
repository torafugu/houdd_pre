class CreateMediumResearchAllotments < ActiveRecord::Migration
  def change
    create_table :medium_research_allotments do |t|
      t.references :medium_houdd_user
      t.string :research_sym
      t.integer :level
      t.integer :research_point
      t.integer :allotment

      t.timestamps
    end
    add_index :medium_research_allotments, :medium_houdd_user_id
  end
end
