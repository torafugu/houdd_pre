class CreateMostsmallskilllvltbls < ActiveRecord::Migration
  def change
    create_table :mostsmallskilllvltbls do |t|
      t.references :mostsmallskill
      t.integer :level
      t.integer :sp_cost
      t.integer :num_of_tgt
      t.integer :accuracy
      t.integer :range
      t.integer :damage

      t.timestamps
    end
    add_index :mostsmallskilllvltbls, :mostsmallskill_id
  end
end
