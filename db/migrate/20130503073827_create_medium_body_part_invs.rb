class CreateMediumBodyPartInvs < ActiveRecord::Migration
  def change
    create_table :medium_body_part_invs do |t|
      t.references :medium_specie
      t.references :medium_body_part
      t.integer :num_of_tgt
      t.references :medium_atk_info

      t.timestamps
    end
    add_index :medium_body_part_invs, :medium_specie_id
    add_index :medium_body_part_invs, :medium_body_part_id
    add_index :medium_body_part_invs, :medium_atk_info_id
  end
end
