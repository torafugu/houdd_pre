class CreateMediumMissionInvs < ActiveRecord::Migration
  def change
    create_table :medium_mission_invs do |t|
      t.references :medium_mission
      t.references :medium_squad

      t.timestamps
    end
    add_index :medium_mission_invs, :medium_mission_id
    add_index :medium_mission_invs, :medium_squad_id
  end
end
