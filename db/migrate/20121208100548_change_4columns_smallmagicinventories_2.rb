class Change4columnsSmallmagicinventories2 < ActiveRecord::Migration
  def change
    remove_index :smallmagicinventories, :smallmagic_id
    remove_column :smallmagicinventories, :smallmagic_id
    add_column :smallmagicinventories, :smallmagicinfo_id, :integer
    add_index :smallmagicinventories, :smallmagicinfo_id
  end
end
