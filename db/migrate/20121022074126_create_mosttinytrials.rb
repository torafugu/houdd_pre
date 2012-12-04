class CreateMosttinytrials < ActiveRecord::Migration
  def change
    create_table :mosttinytrials do |t|
      t.references :mosttinyuser
      t.integer :def_user_id
      t.integer :map_id
      t.integer :atk_user_id

      t.timestamps
    end
    add_index :mosttinytrials, :mosttinyuser_id
  end
end
