class CreateMediumMissions < ActiveRecord::Migration
  def change
    create_table :medium_missions do |t|
      t.references :medium_houdd_user
      t.references :medium_map
      t.string :category_sym
      t.references :medium_mission_strategy
      t.integer :priority

      t.timestamps
    end
    add_index :medium_missions, :medium_houdd_user_id
    add_index :medium_missions, :medium_map_id
    add_index :medium_missions, :medium_mission_strategy_id
  end
end
