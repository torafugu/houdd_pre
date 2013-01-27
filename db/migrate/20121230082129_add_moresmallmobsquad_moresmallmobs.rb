class AddMoresmallmobsquadMoresmallmobs < ActiveRecord::Migration
  def change
    add_column :moresmallmobs, :moresmallmobsquad_id, :integer
    add_index :moresmallmobs, :moresmallmobsquad_id
  end
end
