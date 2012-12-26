class CreateSmallmobs < ActiveRecord::Migration
  def change
    create_table :smallmobs do |t|
      t.references :smallmobinfo
      t.references :smalluser
      t.string :name
      t.integer :hp
      t.integer :mp
      t.boolean :is_dead
      t.boolean :is_assigned

      t.timestamps
    end
    add_index :smallmobs, :smallmobinfo_id
    add_index :smallmobs, :smalluser_id
  end
end
