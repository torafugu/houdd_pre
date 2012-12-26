class CreateSmallmobsquads < ActiveRecord::Migration
  def change
    create_table :smallmobsquads do |t|
      t.references :smalluser
      t.string :name

      t.timestamps
    end
    add_index :smallmobsquads, :smalluser_id
  end
end
