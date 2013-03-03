class CreateMostsmallconstructions < ActiveRecord::Migration
  def change
    create_table :mostsmallconstructions do |t|
      t.references :mostsmallterritory
      t.references :mostsmallconstructioninfo
      t.integer :x
      t.integer :y
      t.integer :level

      t.timestamps
    end
    add_index :mostsmallconstructions, :mostsmallterritory_id
    add_index :mostsmallconstructions, :mostsmallconstructioninfo_id
  end
end
