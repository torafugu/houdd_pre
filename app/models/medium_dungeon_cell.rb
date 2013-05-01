class MediumDungeonCell < ActiveRecord::Base
  belongs_to :medium_dungeon
  belongs_to :medium_squad
end
