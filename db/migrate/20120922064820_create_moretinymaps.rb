class CreateMoretinymaps < ActiveRecord::Migration
  def change
    create_table :moretinymaps do |t|
      t.string :name
      t.integer :type
      t.text :map

      t.timestamps
    end
  end
end
