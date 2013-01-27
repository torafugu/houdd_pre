class CreateMoresmallarmorinfos < ActiveRecord::Migration
  def change
    create_table :moresmallarmorinfos do |t|
      t.string :name
      t.integer :category_id
      t.integer :def

      t.timestamps
    end
  end
end
