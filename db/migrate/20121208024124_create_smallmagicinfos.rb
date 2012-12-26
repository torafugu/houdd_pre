class CreateSmallmagicinfos < ActiveRecord::Migration
  def change
    create_table :smallmagicinfos do |t|
      t.string :name
      t.integer :category_id
      t.integer :heal
      t.integer :damage
      t.integer :mp_cost

      t.timestamps
    end
  end
end
