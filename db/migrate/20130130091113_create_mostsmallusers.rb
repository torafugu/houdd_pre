class CreateMostsmallusers < ActiveRecord::Migration
  def change
    create_table :mostsmallusers do |t|
      t.string :name
      t.boolean :is_admin
      t.string :login_id
      t.string :login_pw
      t.datetime :first_login_at
      t.datetime :last_login_at

      t.timestamps
    end
  end
end
