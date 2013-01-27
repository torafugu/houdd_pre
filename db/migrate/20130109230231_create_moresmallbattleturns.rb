class CreateMoresmallbattleturns < ActiveRecord::Migration
  def change
    create_table :moresmallbattleturns do |t|
      t.references :moresmalltrialturn
      t.text :log

      t.timestamps
    end
    add_index :moresmallbattleturns, :moresmalltrialturn_id
  end
end
