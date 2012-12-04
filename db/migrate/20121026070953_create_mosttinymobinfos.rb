class CreateMosttinymobinfos < ActiveRecord::Migration
  def change
    create_table :mosttinymobinfos do |t|
      t.string :name
      t.integer :category
      t.integer :hp
      t.integer :str
      t.integer :def
      t.integer :agi

      t.timestamps
    end
  end
end
