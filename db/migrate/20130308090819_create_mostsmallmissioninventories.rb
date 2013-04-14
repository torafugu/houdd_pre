class CreateMostsmallmissioninventories < ActiveRecord::Migration
  def change
    create_table :mostsmallmissioninventories do |t|
      t.references :mostsmallmission
      t.references :mostsmallsquad

      t.timestamps
    end
    add_index :mostsmallmissioninventories, :mostsmallmission_id
    add_index :mostsmallmissioninventories, :mostsmallsquad_id
  end
end
