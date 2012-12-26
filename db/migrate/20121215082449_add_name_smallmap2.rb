class AddNameSmallmap2 < ActiveRecord::Migration
  def change
    add_column :smallmaps, :name, :string
  end
end
