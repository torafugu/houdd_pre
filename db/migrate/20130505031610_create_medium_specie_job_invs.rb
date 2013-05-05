class CreateMediumSpecieJobInvs < ActiveRecord::Migration
  def change
    create_table :medium_specie_job_invs do |t|
      t.references :medium_specie
      t.references :medium_job
      t.integer :ratio

      t.timestamps
    end
    add_index :medium_specie_job_invs, :medium_specie_id
    add_index :medium_specie_job_invs, :medium_job_id
  end
end
