class Change3columnsSmallmagicinventories < ActiveRecord::Migration
  def change
    remove_index :smallmagicinventories, :smalluser_id
    remove_column :smallmagicinventories, :smalluser_id
    add_column :smallmagicinventories, :smallmobinfo_id, :integer
    add_index :smallmagicinventories, :smallmobinfo_id
  end
end
