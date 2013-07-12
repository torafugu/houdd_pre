class MediumMissionInv < ActiveRecord::Base
  belongs_to :medium_mission
  belongs_to :medium_squad
end
