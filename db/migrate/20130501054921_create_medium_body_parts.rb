class CreateMediumBodyParts < ActiveRecord::Migration
  def change
    create_table :medium_body_parts do |t|
      t.string :name
      t.integer :size
      t.boolean :eqp_wepon_flg
      t.boolean :eqp_armor_flg

      t.timestamps
    end
  end
end
