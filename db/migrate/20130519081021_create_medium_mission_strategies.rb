class CreateMediumMissionStrategies < ActiveRecord::Migration
  def change
    create_table :medium_mission_strategies do |t|
      t.references :medium_houdd_user
      t.string :name
      t.text :script

      t.timestamps
    end
    add_index :medium_mission_strategies, :medium_houdd_user_id
  end
end
