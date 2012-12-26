class CreateSmallweponinfos < ActiveRecord::Migration
  def change
    create_table :smallweponinfos do |t|
      t.string :name
      t.integer :category_id
      t.integer :atk

      t.timestamps
    end
  end
end
