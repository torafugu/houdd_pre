class CreateMoresmallweponinventories < ActiveRecord::Migration
  def change
    create_table :moresmallweponinventories do |t|
      t.references :moresmallmob
      t.references :moresmallweponinfo

      t.timestamps
    end
    add_index :moresmallweponinventories, :moresmallmob_id
    add_index :moresmallweponinventories, :moresmallweponinfo_id
  end
end
