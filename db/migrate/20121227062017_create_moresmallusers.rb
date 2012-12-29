class CreateMoresmallusers < ActiveRecord::Migration
  def change
    create_table :moresmallusers do |t|
      t.string :name
      t.string :login_id
      t.string :login_pw
      t.datetime :first_login_at
      t.datetime :last_login_at

      t.timestamps
    end
  end
end
