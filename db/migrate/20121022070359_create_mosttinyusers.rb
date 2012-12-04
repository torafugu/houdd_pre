class CreateMosttinyusers < ActiveRecord::Migration
  def change
    create_table :mosttinyusers do |t|
      t.string :name

      t.timestamps
    end
  end
end
