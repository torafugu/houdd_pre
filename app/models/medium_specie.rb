class MediumSpecie < ActiveRecord::Base
  belongs_to :medium_family
  has_many :medium_jobs, :through => :medium_specie_job_invs
  has_many :medium_specie_job_invs, :dependent => :delete_all
end
