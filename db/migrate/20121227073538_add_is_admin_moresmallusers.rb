class AddIsAdminMoresmallusers < ActiveRecord::Migration
  def change
    add_column :moresmallusers, :is_admin, :boolean
  end
end
