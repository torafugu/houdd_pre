class CreateMostsmallresearches < ActiveRecord::Migration
  def change
    create_table :mostsmallresearches do |t|
      t.string :name

      t.timestamps
    end
  end
end
