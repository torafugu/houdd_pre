class MediumItemInfo < ActiveRecord::Base
  belongs_to :medium_body_part
  belongs_to :medium_atk_info
  belongs_to :medium_status_mod
end
