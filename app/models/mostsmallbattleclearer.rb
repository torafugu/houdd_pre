class Mostsmallbattleclearer
  def self.clear_by_id(battleset_id)
    clear(Mostsmallbattleset.find(battleset_id))
  end

  def self.clear(battleset)
    battleset.mostsmallbattleturns.each do |battleturn|
      battleturn.mostsmallbattlelogs.clear
      battleturn.save
    end
    battleset.mostsmallbattleturns.clear
    battleset.save
  end

  def self.restore_mobs
    Mostsmallmob.all.each do |mob|
      mob.hp = mob.max_hp
      mob.sp = mob.max_sp
      mob.battle_exp = 0
      mob.job_exp = 0
      mob.mostsmallbattleeffectinventories.clear
      mob.save
    end
  end
end

