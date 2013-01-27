class Moresmallstrategyhandler

  DO_OR_DIE = 1
  ASSAULT = 2
  BALANCE = 3
  PRESERVE = 4
  GO_SLOW = 5
  SCOUTING = 6

  def self.retreated_by_id?(trial_id, is_guard)
    return retreated?(Moresmalltrial.find(trial_id), is_guard)
  end

  def self.guard_retreated?(trial)
    return retreated?(trial, true)
  end

  def self.intruder_retreated?(trial)
    return retreated?(trial, false)
  end

  def self.retreated?(trial, is_guard)

    tgt_unit = trial.def_mobunit
    tgt_unit = trial.atk_mobunit if is_guard
    strategy_id = tgt_unit.moresmallstrategy.id
    
    living_squads = Array.new
    tgt_unit.moresmallmobsquads.each do |squad|
      living_squads << squad unless squad.annihilated?
    end
    #p "Living squads size:" + living_squads.length.to_s
    survival_rate = living_squads.size.quo(tgt_unit.moresmallmobsquads.size)
    #p "Survival rate:" + survival_rate.to_s
    return true if strategy_id == SCOUTING
    return true if strategy_id == GO_SLOW and survival_rate < 0.9
    return true if strategy_id == PRESERVE and survival_rate < 0.7
    return true if strategy_id == BALANCE and survival_rate < 0.5
    return true if strategy_id == ASSAULT and survival_rate < 0.3
    return true if strategy_id == DO_OR_DIE and survival_rate == 0
    return false
  end
end
