class CreateMostsmallskilleffectinventories < ActiveRecord::Migration
  def change
    create_table :mostsmallskilleffectinventories do |t|
      t.references :mostsmallskill
      t.references :mostsmalleffect

      t.timestamps
    end
    add_index :mostsmallskilleffectinventories, :mostsmallskill_id
    add_index :mostsmallskilleffectinventories, :mostsmalleffect_id
  end
end
