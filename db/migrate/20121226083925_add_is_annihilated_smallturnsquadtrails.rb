class AddIsAnnihilatedSmallturnsquadtrails < ActiveRecord::Migration
  def change
    add_column :smallturnsquadtrails, :is_annihilated, :boolean
  end
end
