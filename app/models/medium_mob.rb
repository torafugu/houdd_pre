class MediumMob < ActiveRecord::Base
  belongs_to :medium_houdd_user
  belongs_to :medium_specie
  belongs_to :medium_job
  belongs_to :medium_squad
  has_many :medium_skills, :through => :medium_skill_exp_invs
  has_many :medium_skill_exp_invs, :dependent => :delete_all
end
