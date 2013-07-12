class MediumSkill < ActiveRecord::Base
  belongs_to :medium_job
  belongs_to :medium_atk_info
  belongs_to :medium_status_mod

  def heal?
    return true if medium_atk_info.inst_damage < 0
    return false
  end
end
