class CreateMoresmalltrialsquadpers < ActiveRecord::Migration
  def change
    create_table :moresmalltrialsquadpers do |t|
      t.references :moresmalltrial
      t.integer :mobunit_id
      t.integer :squad_id
      t.string :squad_name

      t.timestamps
    end
    add_index :moresmalltrialsquadpers, :moresmalltrial_id
  end
end
