class CreateMostsmallbattleturns < ActiveRecord::Migration
  def change
    create_table :mostsmallbattleturns do |t|
      t.references :mostsmallbattleset
      t.text :log

      t.timestamps
    end
    add_index :mostsmallbattleturns, :mostsmallbattleset_id
  end
end
