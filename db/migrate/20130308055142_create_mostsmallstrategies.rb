class CreateMostsmallstrategies < ActiveRecord::Migration
  def change
    create_table :mostsmallstrategies do |t|
      t.string :name

      t.timestamps
    end
  end
end
