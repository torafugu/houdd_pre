class CreateMoresmalltops < ActiveRecord::Migration
  def change
    create_table :moresmalltops do |t|
      t.references :moresmalluser

      t.timestamps
    end
    add_index :moresmalltops, :moresmalluser_id
  end
end
