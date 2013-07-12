class MediumTrialTurn < ActiveRecord::Base
  belongs_to :medium_trial
  has_many :medium_squad_trails, :dependent => :delete_all
  has_many :medium_mob_statuses, :dependent => :delete_all
  has_many :medium_battle_turns, :dependent => :delete_all
end
