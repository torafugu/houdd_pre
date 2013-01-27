class CreateMoresmallweponinfos < ActiveRecord::Migration
  def change
    create_table :moresmallweponinfos do |t|
      t.string :name
      t.integer :category_id
      t.integer :atk
      t.integer :accuracy
      t.integer :range

      t.timestamps
    end
  end
end
