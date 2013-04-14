class Remove2columnsMostsmallmobs < ActiveRecord::Migration
  def change
    remove_column :mostsmallmobs, :max_hp
    remove_column :mostsmallmobs, :max_sp
  end
end
