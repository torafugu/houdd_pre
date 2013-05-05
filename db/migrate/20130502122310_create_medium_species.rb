class CreateMediumSpecies < ActiveRecord::Migration
  def change
    create_table :medium_species do |t|
      t.references :medium_family
      t.string :name
      t.float :prolificacy
      t.float :longevity
      t.float :growth_rate
      t.float :cost
      t.integer :str
      t.integer :dex
      t.integer :con
      t.integer :int
      t.integer :wis
      t.integer :cha
      t.integer :phys_def
      t.integer :skill_def
      t.integer :ele_fw_mod
      t.integer :ele_ld_mod
      t.string :ability_sym

      t.timestamps
    end
    add_index :medium_species, :medium_family_id
  end
end
