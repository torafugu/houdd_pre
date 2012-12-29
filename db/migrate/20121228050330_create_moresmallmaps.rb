class CreateMoresmallmaps < ActiveRecord::Migration
  def change
    create_table :moresmallmaps do |t|
      t.references :smalluser
      t.integer :category_id
      t.string :name
      t.text :txt
      t.integer :start_trial_id
      t.integer :end_trial_id

      t.timestamps
    end
    add_index :moresmallmaps, :smalluser_id
  end
end
