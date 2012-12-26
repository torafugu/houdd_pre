class CreateSmallweponinventories < ActiveRecord::Migration
  def change
    create_table :smallweponinventories do |t|
      t.references :smallmob
      t.references :smallweponinfo

      t.timestamps
    end
    add_index :smallweponinventories, :smallmob_id
    add_index :smallweponinventories, :smallweponinfo_id
  end
end
