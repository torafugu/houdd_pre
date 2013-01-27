class CreateMoresmallmobsquads < ActiveRecord::Migration
  def change
    create_table :moresmallmobsquads do |t|
      t.references :moresmalluser
      t.references :moresmallmobunit
      t.string :name

      t.timestamps
    end
    add_index :moresmallmobsquads, :moresmalluser_id
    add_index :moresmallmobsquads, :moresmallmobunit_id
  end
end
