class Mosttinystrategyhandler

  DO_OR_DIE = 1
  ASSAULT = 2
  BALANCE = 3
  PRESERVE = 4
  GO_SLOW = 5
  SCOUTING = 6

  def self.retreat_by_id?(trial_id, is_guard)
    mosttinytrial = Mosttinytrial.find(trial_id, :include => [:def_user, :atk_user, :def_strategy, :atk_strategy, {:mosttinymobsetups => {:mosttinymob => :mosttinymobinfo}}])
    return retreat?(mosttinytrial, is_guard)
  end

  def self.retreat?(trial, is_guard)

    strategy = is_guard ? trial.def_strategy_id : trial.atk_strategy_id
    
    living_mobs = Array.new
    trial.mosttinymobsetups.each do |mobsetup|
      if mobsetup.is_guard == is_guard and not mobsetup.mosttinymob.is_dead
        living_mobs << mobsetup
      end
    end
    survival_rate = living_mobs.size.quo(trial.mosttinymobsetups.size)
    p strategy
    return true if strategy == SCOUTING
    return true if strategy == GO_SLOW and survival_rate < 0.9
    return true if strategy == PRESERVE and survival_rate < 0.7
    return true if strategy == BALANCE and survival_rate < 0.5
    return true if strategy == ASSAULT and survival_rate < 0.3
    return true if strategy == DO_OR_DIE and survival_rate == 0
    return false
  end

end
