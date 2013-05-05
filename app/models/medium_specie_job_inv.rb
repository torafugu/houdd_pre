class MediumSpecieJobInv < ActiveRecord::Base
  belongs_to :medium_specie
  belongs_to :medium_job
end
