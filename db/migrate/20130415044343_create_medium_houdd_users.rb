class CreateMediumHouddUsers < ActiveRecord::Migration
  def change
    create_table :medium_houdd_users do |t|
      t.string :name
      t.boolean :admin_flg
      t.string :login_id
      t.string :login_pw
      t.datetime :first_login_at
      t.datetime :last_login_at
      t.integer :wepon_lvl
      t.integer :armor_lvl
      t.integer :potion_lvl
      t.integer :trap_lvl
      t.integer :skill_lvl
      t.integer :next_item_id
      t.integer :prod_for_item
      t.integer :next_const_id
      t.integer :prod_for_const
      t.string :next_research_sym
      t.integer :prod_for_research

      t.timestamps
    end
  end
end
