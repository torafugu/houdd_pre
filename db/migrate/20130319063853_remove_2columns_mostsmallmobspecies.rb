class Remove2columnsMostsmallmobspecies < ActiveRecord::Migration
  def change
    remove_column :mostsmallmobspecies, :damage
    remove_column :mostsmallmobspecies, :ac
  end
end
