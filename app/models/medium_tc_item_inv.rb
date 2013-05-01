class MediumTcItemInv < ActiveRecord::Base
  belongs_to :medium_dungeon_cell
  belongs_to :medium_item
end
