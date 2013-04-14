class Add3columnsMostsmallequipslots < ActiveRecord::Migration
  def change
    add_column :mostsmallequipslots, :num_of_tgt, :integer
    add_column :mostsmallequipslots, :accuracy, :integer
    add_column :mostsmallequipslots, :range, :integer
    add_column :mostsmallequipslots, :damage, :integer
    add_column :mostsmallequipslots, :ac, :integer
  end
end
