class CreateSmallusers < ActiveRecord::Migration
  def change
    create_table :smallusers do |t|
      t.string :name
      t.string :login_id
      t.string :login_pw
      t.datetime :last_login_at

      t.timestamps
    end
  end
end
