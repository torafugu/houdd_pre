class CreateMostsmallconstructioninfos < ActiveRecord::Migration
  def change
    create_table :mostsmallconstructioninfos do |t|
      t.integer :mostsmallconstructionfamily_id
      t.string :name
      t.integer :const_period

      t.timestamps
    end
  end
end
