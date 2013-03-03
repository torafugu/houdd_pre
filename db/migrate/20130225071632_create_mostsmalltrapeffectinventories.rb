class CreateMostsmalltrapeffectinventories < ActiveRecord::Migration
  def change
    create_table :mostsmalltrapeffectinventories do |t|
      t.references :mostsmalltraplvltbl
      t.references :mostsmalleffect

      t.timestamps
    end
    add_index :mostsmalltrapeffectinventories, :mostsmalltraplvltbl_id
    add_index :mostsmalltrapeffectinventories, :mostsmalleffect_id
  end
end
