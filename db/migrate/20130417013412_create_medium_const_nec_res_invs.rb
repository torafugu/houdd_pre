class CreateMediumConstNecResInvs < ActiveRecord::Migration
  def change
    create_table :medium_const_nec_res_invs do |t|
      t.references :medium_construction
      t.references :medium_resource

      t.timestamps
    end
    add_index :medium_const_nec_res_invs, :medium_construction_id
    add_index :medium_const_nec_res_invs, :medium_resource_id
  end
end
