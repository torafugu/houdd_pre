class Remove2columns2Mostsmallmobspecies < ActiveRecord::Migration
  def change
    remove_column :mostsmallmobspecies, :max_hp
    remove_column :mostsmallmobspecies, :max_sp
  end
end
