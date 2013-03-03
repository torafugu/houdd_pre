class CreateMostsmallitemeffectinventories < ActiveRecord::Migration
  def change
    create_table :mostsmallitemeffectinventories do |t|
      t.references :mostsmalliteminfo
      t.references :mostsmalleffect

      t.timestamps
    end
    add_index :mostsmallitemeffectinventories, :mostsmalliteminfo_id
    add_index :mostsmallitemeffectinventories, :mostsmalleffect_id
  end
end
