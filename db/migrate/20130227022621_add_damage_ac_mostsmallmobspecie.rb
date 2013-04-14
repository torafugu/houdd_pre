class AddDamageAcMostsmallmobspecie < ActiveRecord::Migration
  def change
    add_column :mostsmallmobspecies, :atk, :integer
    add_column :mostsmallmobspecies, :ac, :integer
  end
end
