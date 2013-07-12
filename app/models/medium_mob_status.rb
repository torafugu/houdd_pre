class MediumMobStatus < ActiveRecord::Base
  belongs_to :medium_trial_turn
  belongs_to :trial_mob, :class_name => 'MediumTrialMob', :foreign_key => 'trial_mob_id'
end
