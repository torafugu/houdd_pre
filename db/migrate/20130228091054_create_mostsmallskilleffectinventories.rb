class CreateMostsmallskilleffectinventories < ActiveRecord::Migration
  def change
    create_table :mostsmallskilleffectinventories do |t|
      t.references :mostsmallskilllvltbl
      t.references :mostsmalleffect

      t.timestamps
    end
    add_index :mostsmallskilleffectinventories, :mostsmallskilllvltbl_id
    add_index :mostsmallskilleffectinventories, :mostsmalleffect_id
  end
end
