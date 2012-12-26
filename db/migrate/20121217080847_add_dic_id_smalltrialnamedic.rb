class AddDicIdSmalltrialnamedic < ActiveRecord::Migration
  def change
    add_column :smalltrialnamedics, :dic_id, :integer
  end
end
