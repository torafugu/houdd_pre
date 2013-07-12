class MediumMapCell < ActiveRecord::Base
  belongs_to :medium_map
  belongs_to :medium_terrain
  belongs_to :medium_resource
  belongs_to :medium_construction
  has_one :medium_dungeon

  def name
    return medium_map.name + ":(" + read_attribute(:x).to_s + "," + read_attribute(:y).to_s + ")"
  end
end
