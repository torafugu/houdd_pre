class CreateMediumMobDnas < ActiveRecord::Migration
  def change
    create_table :medium_mob_dnas do |t|
      t.references :medium_mob
      t.references :medium_gene

      t.timestamps
    end
    add_index :medium_mob_dnas, :medium_mob_id
    add_index :medium_mob_dnas, :medium_gene_id
  end
end
