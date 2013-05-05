class CreateMediumSkills < ActiveRecord::Migration
  def change
    create_table :medium_skills do |t|
      t.string :skill_category_sym
      t.references :medium_job
      t.string :element_sym
      t.string :name
      t.integer :sp_cost
      t.integer :num_of_tgt
      t.references :medium_atk_info
      t.references :medium_status_mod
      t.integer :duration

      t.timestamps
    end
    add_index :medium_skills, :medium_job_id
    add_index :medium_skills, :medium_atk_info_id
    add_index :medium_skills, :medium_status_mod_id
  end
end
