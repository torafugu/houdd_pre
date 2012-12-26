class Smalltrialclearer
  def self.clear_by_id(trial_id)
    trial = Smalltrial.find(trial_id)
    trial.smalltrialstatus_id = 1
    trial.smalltrialturns.each do |smalltrialturn|
      smalltrialturn.smallturnsquadtrails.clear 
      smalltrialturn.smallturnmobstatuses.clear 
      smalltrialturn.smallturnbattlelogs.clear
      smalltrialturn.save
    end
    trial.smalltrialturns.clear
    trial.smalltrialmoblineups.clear
    trial.save
    mobs = Smallmob.all
    mobs.each do |mob|
      mob.hp = mob.max_hp
      mob.mp = mob.max_mp
      mob.save
    end
  end
end

