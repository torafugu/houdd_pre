class CreateTinymaps < ActiveRecord::Migration
  def change
    create_table :tinymaps do |t|
      t.string :name
      t.text :map

      t.timestamps
    end
  end
end
