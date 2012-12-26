class AddHealSmallturnbattlelogs < ActiveRecord::Migration
  def change
    add_column :smallturnbattlelogs, :heal, :integer
  end
end
