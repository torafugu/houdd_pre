class CreateMostsmallbattlesets < ActiveRecord::Migration
  def change
    create_table :mostsmallbattlesets do |t|
      t.references :mostsmalltrialturn
      t.integer :atk_squad_id
      t.integer :def_squad_id

      t.timestamps
    end
    add_index :mostsmallbattlesets, :mostsmalltrialturn_id
  end
end
