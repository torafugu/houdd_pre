class MediumDungeon < ActiveRecord::Base
  belongs_to :medium_map_cell
  has_many :medium_dungeon_cells
end
