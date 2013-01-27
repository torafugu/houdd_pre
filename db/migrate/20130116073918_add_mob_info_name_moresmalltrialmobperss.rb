class AddMobInfoNameMoresmalltrialmobperss < ActiveRecord::Migration
  def change
    add_column :moresmalltrialmobpers, :mob_info_name, :string
  end
end
