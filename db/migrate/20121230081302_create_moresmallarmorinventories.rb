class CreateMoresmallarmorinventories < ActiveRecord::Migration
  def change
    create_table :moresmallarmorinventories do |t|
      t.references :moresmallmob
      t.references :moresmallarmorinfo

      t.timestamps
    end
    add_index :moresmallarmorinventories, :moresmallmob_id
    add_index :moresmallarmorinventories, :moresmallarmorinfo_id
  end
end
