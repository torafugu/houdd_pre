class CreateSmalltops < ActiveRecord::Migration
  def change
    create_table :smalltops do |t|
      t.references :smalluser

      t.timestamps
    end
    add_index :smalltops, :smalluser_id
  end
end
