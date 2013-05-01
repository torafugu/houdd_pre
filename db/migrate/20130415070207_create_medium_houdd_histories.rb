class CreateMediumHouddHistories < ActiveRecord::Migration
  def change
    create_table :medium_houdd_histories do |t|
      t.integer :days

      t.timestamps
    end
  end
end
