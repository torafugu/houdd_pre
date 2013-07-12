class MediumTrialSquad < ActiveRecord::Base
  belongs_to :medium_trial
  has_many :medium_trial_mobs, :dependent => :delete_all

  def atk?
    #p medium_trial.atk_squads_view.collect{|s| s.id}
    #p read_attribute(:id)
    return true if medium_trial.atk_squads_view.collect{|s| s.id}.include?(read_attribute(:id))
    return false
  end
end
