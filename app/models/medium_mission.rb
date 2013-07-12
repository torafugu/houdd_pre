class MediumMission < ActiveRecord::Base
  belongs_to :medium_houdd_user
  belongs_to :medium_map
  belongs_to :medium_mission_strategy
  has_many :medium_squads, :through => :medium_mission_invs
  has_many :medium_mission_invs, :dependent => :delete_all

  def name
    medium_map.name + ":" + MediumSymbolList.find_by_category_sym_and_symbol("MISSION", read_attribute(:category_sym)).description
  end

  def strategy
    strategy = MediumStrategy.new
    strategy.eval_script(medium_mission_strategy.script)
    return strategy
  end

  def trial
    def_trial = MediumTrial.find_by_def_mission_id(read_attribute(:id))
    return def_trial unless def_trial.blank?
    atk_trial = MediumTrial.find_by_atk_mission_id(read_attribute(:id))
    return atk_trial unless atk_trial.blank?
  end
end
