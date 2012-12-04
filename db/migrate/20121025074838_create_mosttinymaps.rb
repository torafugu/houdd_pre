class CreateMosttinymaps < ActiveRecord::Migration
  def change
    create_table :mosttinymaps do |t|
      t.references :mosttinyuser
      t.string :name
      t.integer :prev_id
      t.text :map
      t.integer :category

      t.timestamps
    end
    add_index :mosttinymaps, :mosttinyuser_id
  end
end
