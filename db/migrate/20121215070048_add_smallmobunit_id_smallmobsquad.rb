class AddSmallmobunitIdSmallmobsquad < ActiveRecord::Migration
  def change
    add_column :smallmobsquads, :smallmobunit_id, :integer
  end
end
