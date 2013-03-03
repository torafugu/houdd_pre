class CreateMostsmallskillcategories < ActiveRecord::Migration
  def change
    create_table :mostsmallskillcategories do |t|
      t.string :name

      t.timestamps
    end
  end
end
