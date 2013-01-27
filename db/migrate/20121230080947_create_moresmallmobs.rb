class CreateMoresmallmobs < ActiveRecord::Migration
  def change
    create_table :moresmallmobs do |t|
      t.references :moresmallmobinfo
      t.references :moresmalluser
      t.string :name
      t.integer :hp
      t.integer :mp

      t.timestamps
    end
    add_index :moresmallmobs, :moresmallmobinfo_id
    add_index :moresmallmobs, :moresmalluser_id
  end
end
