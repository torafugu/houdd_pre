class CreateMoresmallturnmobstatuses < ActiveRecord::Migration
  def change
    create_table :moresmallturnmobstatuses do |t|
      t.references :moresmalltrialturn
      t.integer :mob_id
      t.integer :start_hp
      t.integer :end_hp
      t.integer :start_mp
      t.integer :end_mp
      t.text :status

      t.timestamps
    end
    add_index :moresmallturnmobstatuses, :moresmalltrialturn_id
  end
end
