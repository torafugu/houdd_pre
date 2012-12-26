class AddUnitIdSquadIdSmalltrialmoblog < ActiveRecord::Migration
  def change
    add_column :smalltrialmoblogs, :unit_id, :integer
    add_column :smalltrialmoblogs, :squad_id, :integer
  end
end
