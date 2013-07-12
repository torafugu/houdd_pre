class MediumItemEquipInv < ActiveRecord::Base
  belongs_to :medium_item
  belongs_to :medium_mob
  belongs_to :medium_body_part
end
