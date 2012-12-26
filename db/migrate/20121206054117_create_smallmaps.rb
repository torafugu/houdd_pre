class CreateSmallmaps < ActiveRecord::Migration
  def change
    create_table :smallmaps do |t|
      t.references :smalluser
      t.integer :category_id
      t.text :txt
      t.integer :start_trial_id
      t.integer :end_trial_id

      t.timestamps
    end
    add_index :smallmaps, :smalluser_id
  end
end
