class CreateMostsmallspeciejobinventories < ActiveRecord::Migration
  def change
    create_table :mostsmallspeciejobinventories do |t|
      t.references :mostsmallmobspecie
      t.references :mostsmalljob

      t.timestamps
    end
    add_index :mostsmallspeciejobinventories, :mostsmallmobspecie_id
    add_index :mostsmallspeciejobinventories, :mostsmalljob_id
  end
end
