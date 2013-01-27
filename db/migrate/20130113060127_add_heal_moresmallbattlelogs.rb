class AddHealMoresmallbattlelogs < ActiveRecord::Migration
  def change
    add_column :moresmallbattlelogs, :heal, :integer
  end
end
