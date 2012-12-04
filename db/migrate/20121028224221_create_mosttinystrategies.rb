class CreateMosttinystrategies < ActiveRecord::Migration
  def change
    create_table :mosttinystrategies do |t|
      t.string :name

      t.timestamps
    end
  end
end
