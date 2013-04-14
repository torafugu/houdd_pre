class CreateMostsmalltrialsquads < ActiveRecord::Migration
  def change
    create_table :mostsmalltrialsquads do |t|
      t.references :mostsmalltrial
      t.integer :squad_id
      t.string :squad_name

      t.timestamps
    end
    add_index :mostsmalltrialsquads, :mostsmalltrial_id
  end
end
