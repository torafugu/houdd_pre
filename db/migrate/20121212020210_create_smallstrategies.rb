class CreateSmallstrategies < ActiveRecord::Migration
  def change
    create_table :smallstrategies do |t|
      t.string :name

      t.timestamps
    end
  end
end
