class CreateSmallmagicinventories < ActiveRecord::Migration
  def change
    create_table :smallmagicinventories do |t|
      t.references :smalluser
      t.references :smallmagic

      t.timestamps
    end
    add_index :smallmagicinventories, :smalluser_id
    add_index :smallmagicinventories, :smallmagic_id
  end
end
