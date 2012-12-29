class Rename2columnsMoresmallmaps < ActiveRecord::Migration
  def change
    remove_index :moresmallmaps, :smalluser_id
    remove_column :moresmallmaps, :smalluser_id
    add_column :moresmallmaps, :moresmalluser_id, :integer
    add_index :moresmallmaps, :moresmalluser_id
  end
end
