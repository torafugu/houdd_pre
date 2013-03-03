class CreateMostsmallterrains < ActiveRecord::Migration
  def change
    create_table :mostsmallterrains do |t|
      t.string :symbol
      t.string :name

      t.timestamps
    end
  end
end
