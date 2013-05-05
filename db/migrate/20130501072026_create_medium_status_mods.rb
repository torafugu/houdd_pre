class CreateMediumStatusMods < ActiveRecord::Migration
  def change
    create_table :medium_status_mods do |t|
      t.string :name
      t.integer :str_mod
      t.integer :dex_mod
      t.integer :con_mod
      t.integer :int_mod
      t.integer :wis_mod
      t.integer :cha_mod
      t.integer :ele_fw_mod
      t.integer :ele_ld_mod
      t.integer :duration

      t.timestamps
    end
  end
end
