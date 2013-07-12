class MediumMissionStrategy < ActiveRecord::Base
  belongs_to :medium_houdd_user
  has_many :medium_missions
end
