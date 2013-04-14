class CreateMostsmallhistories < ActiveRecord::Migration
  def change
    create_table :mostsmallhistories do |t|
      t.integer :days

      t.timestamps
    end
  end
end
