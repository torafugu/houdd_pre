class AddSmalltrialIdSmalltrialturn < ActiveRecord::Migration
  def change
    add_column :smalltrialturns, :smalltrial_id, :integer
    add_index :smalltrialturns, :smalltrial_id
  end
end
