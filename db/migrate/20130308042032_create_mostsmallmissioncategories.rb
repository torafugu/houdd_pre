class CreateMostsmallmissioncategories < ActiveRecord::Migration
  def change
    create_table :mostsmallmissioncategories do |t|
      t.string :name

      t.timestamps
    end
  end
end
