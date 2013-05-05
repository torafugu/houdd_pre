class CreateMediumGenes < ActiveRecord::Migration
  def change
    create_table :medium_genes do |t|
      t.string :name
      t.references :medium_specie
      t.boolean :dominance_flg
      t.float :prolificacy_mod
      t.float :longevity_mod
      t.float :growth_mod
      t.float :cost_mod
      t.float :str_mod
      t.float :dex_mod
      t.float :con_mod
      t.float :int_mod
      t.float :wis_mod
      t.float :cha_mod
      t.float :phys_def_mod
      t.float :skill_def_mod
      t.float :ele_fw_mod
      t.float :ele_ld_mod

      t.timestamps
    end
    add_index :medium_genes, :medium_specie_id
  end
end
