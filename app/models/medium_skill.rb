class MediumSkill < ActiveRecord::Base
  belongs_to :medium_job
  belongs_to :medium_atk_info
  belongs_to :medium_status_mod
end
