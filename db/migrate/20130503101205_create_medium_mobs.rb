class CreateMediumMobs < ActiveRecord::Migration
  def change
    create_table :medium_mobs do |t|
      t.references :medium_houdd_user
      t.references :medium_specie
      t.integer :father_id
      t.integer :mother_id
      t.references :medium_job
      t.references :medium_squad
      t.integer :level
      t.integer :exp
      t.string :name
      t.string :gender_sym
      t.integer :age
      t.integer :hp
      t.integer :sp
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

      t.timestamps
    end
    add_index :medium_mobs, :medium_houdd_user_id
    add_index :medium_mobs, :medium_specie_id
    add_index :medium_mobs, :medium_job_id
    add_index :medium_mobs, :medium_squad_id
  end
end
