class CreateMostsmallskills < ActiveRecord::Migration
  def change
    create_table :mostsmallskills do |t|
      t.references :mostsmallskillcategory
      t.references :mostsmalljob
      t.integer :job_level
      t.references :mostsmallelement
      t.string :name
      t.integer :recast

      t.timestamps
    end
    add_index :mostsmallskills, :mostsmallskillcategory_id
    add_index :mostsmallskills, :mostsmalljob_id
    add_index :mostsmallskills, :mostsmallelement_id
  end
end
