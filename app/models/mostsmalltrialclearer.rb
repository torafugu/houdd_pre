class Mostsmalltrialclearer
  def self.clear_by_id(trial_id)
    trial = Mostsmalltrial.find(trial_id)
    trial.mostsmalltrialturns.each do |turn|
      turn.mostsmallsquadtrails.clear 
      turn.mostsmallmobstatuses.clear
      turn.mostsmallbattlesets.each do |battleset|
        Mostsmallbattleclearer.clear(battleset)
      end
      turn.mostsmallbattlesets.clear
      turn.save
    end
    trial.mostsmalltrialturns.clear
    trial.mostsmalltrialsquads.each do |squad|
      squad.mostsmalltrialmobs.clear
      squad.save
    end
    trial.mostsmalltrialsquads.clear
    trial.save
    Mostsmallmob.all.each do |mob|
      mob.hp = mob.max_hp
      mob.sp = mob.max_sp
      mob.battle_exp = 0
      mob.job_exp = 0
      mob.mostsmallbattleeffectinventories.clear
      mob.save
    end
    Mostsmalltrap.all.each do |trap|
      trap.dp = trap.mostsmalltrapinfo.max_dp
      trap.save
    end
    Mostsmallbattleclearer.restore_mobs
  end
end

