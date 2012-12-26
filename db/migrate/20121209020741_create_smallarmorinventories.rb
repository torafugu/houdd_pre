class CreateSmallarmorinventories < ActiveRecord::Migration
  def change
    create_table :smallarmorinventories do |t|
      t.references :smallmob
      t.references :smallarmorinfo

      t.timestamps
    end
    add_index :smallarmorinventories, :smallmob_id
    add_index :smallarmorinventories, :smallarmorinfo_id
  end
end
