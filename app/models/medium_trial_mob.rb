class MediumTrialMob < ActiveRecord::Base
  belongs_to :medium_trial_squad

  def atk?
    return medium_trial_squad.atk?
  end
end
