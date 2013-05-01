class MediumMapCell < ActiveRecord::Base
  belongs_to :medium_map
  belongs_to :medium_terrain
  belongs_to :medium_resource
  belongs_to :medium_construction
  belongs_to :medium_dungeon
end
