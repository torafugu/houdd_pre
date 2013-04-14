class CreateMostsmalltrapeffectinventories < ActiveRecord::Migration
  def change
    create_table :mostsmalltrapeffectinventories do |t|
      t.references :mostsmalltrapinfo
      t.integer :level
      t.references :mostsmalleffect

      t.timestamps
    end
    add_index :mostsmalltrapeffectinventories, :mostsmalltrapinfo_id
    add_index :mostsmalltrapeffectinventories, :mostsmalleffect_id
  end
end
