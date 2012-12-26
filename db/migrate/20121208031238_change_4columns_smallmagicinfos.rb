class Change4columnsSmallmagicinfos < ActiveRecord::Migration
  def change
    rename_column(:smallmagicinfos, :heal, :high_heal)
    rename_column(:smallmagicinfos, :damage, :high_damage)
    add_column :smallmagicinfos, :low_heal, :integer
    add_column :smallmagicinfos, :low_damage, :integer
  end
end
