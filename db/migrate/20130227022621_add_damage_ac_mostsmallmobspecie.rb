class AddDamageAcMostsmallmobspecie < ActiveRecord::Migration
  def change
    add_column :mostsmallmobspecies, :damage, :integer
    add_column :mostsmallmobspecies, :ac, :integer
  end
end
