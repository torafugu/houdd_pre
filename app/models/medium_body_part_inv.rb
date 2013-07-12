class MediumBodyPartInv < ActiveRecord::Base
  belongs_to :medium_specie
  belongs_to :medium_body_part
  belongs_to :medium_atk_info

  def name
    return medium_body_part.name
  end
end
