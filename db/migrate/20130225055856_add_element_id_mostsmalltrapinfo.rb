class AddElementIdMostsmalltrapinfo < ActiveRecord::Migration
  def change
    add_column :mostsmalltrapinfos, :mostsmallelement_id, :integer
    add_index :mostsmalltrapinfos, :mostsmallelement_id
  end
end
