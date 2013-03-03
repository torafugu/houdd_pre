class CreateMostsmallconstructionfamilies < ActiveRecord::Migration
  def change
    create_table :mostsmallconstructionfamilies do |t|
      t.string :name

      t.timestamps
    end
  end
end
