class CreateMediumJobs < ActiveRecord::Migration
  def change
    create_table :medium_jobs do |t|
      t.string :name
      t.float :growth_penalty
      t.integer :wepon_lvl
      t.integer :armor_lvl

      t.timestamps
    end
  end
end
