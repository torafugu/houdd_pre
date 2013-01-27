class Moresmalltrialclearer
  def self.clear_by_id(trial_id)
    trial = Moresmalltrial.find(trial_id)
    trial.moresmalltrialstatus_id = 1 # not started.
    trial.moresmalltrialturns.each do |turn|
      turn.moresmallturnsquadtrails.clear 
      turn.moresmallturnmobstatuses.clear
      turn.moresmallbattleturns.each do |battleturn|
        battleturn.moresmallbattlelogs.clear
        battleturn.save
      end
      turn.moresmallbattleturns.clear
      turn.save
    end
    trial.moresmalltrialturns.clear
    trial.moresmalltrialsquadperss.each do |squad|
      squad.moresmalltrialmobperss.clear
    end
    trial.moresmalltrialsquadperss.clear
    trial.save
    mobs = Moresmallmob.all
    mobs.each do |mob|
      mob.hp = mob.max_hp
      mob.mp = mob.max_mp
      mob.save
    end
  end
end

