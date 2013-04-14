# coding: utf-8

class Mostsmalltraphandler

  TRAP_DISARM_JOB_EXP = 3
  TRAP_DISARM_BATTLE_EXP = 3

  def self.execute(turn, trap, squad)
    # 1. Disarm trap
    squad.trap_disarmers.each do |disarmer|
      attempt_roll = rand(100)
      log = nil
      if trap.mostsmalltrapinfo.disarm_diff < attempt_roll
        turn.log += disarmer.name + "がトラップ(" + trap.mostsmalltrapinfo.name + ")の解除成功！\n"
        disarmer.job_exp += TRAP_DISARM_JOB_EXP
        trap.dp = 0
        break
      else
        turn.log += disarmer.name + "がトラップ(" + trap.mostsmalltrapinfo.name + ")の解除失敗！\n"
        disarmer.job_exp += TRAP_DISARM_JOB_EXP / 2
      end
    end
    return unless trap.active?
    # 2. Trigger trap
    damaged_mobs = Array.nil?
    if squad.living_mobs.length > trap.mostsmalltrapinfo.num_of_tgt
      damaged_mobs = squad.living_mobs.sample(trap.mostsmalltrapinfo.num_of_tgt)
    else
      damaged_mobs = squad.living_mobs
    end
    trap.dp -= 1
    damaged_mobs.each do |mob|
      damage = Tools.gaussian_rand(trap.mostsmalltrapinfo.damage, trap.mostsmalltrapinfo.damage * 0.5)
      if damage > 0
        mob.hp -= damage
        mob.battle_exp += damage
        mob.save
        turn.log += mob.name + "がトラップ(" + trap.mostsmalltrapinfo.name + ")から" + damage.to_s + "のダメージを受けた。\n"
        turn.log += mob.name + "は死んだ！\n" if mob.dead?
      end
      trap.mostsmalltrapinfo.mostsmalleffects.each do |effect|
        battle_effect = Mostsmallbattleeffectinventory.new
        battle_effect.mostsmallmob_id = mob.id
        battle_effect.mostsmalleffect_id = effect.id
        battle_effect.remaining_duration = effect.duration
        turn.log += mob.name + "がトラップ(" + trap.mostsmalltrapinfo.name + ")から" + effect.name + "の追加効果を受けた。\n"
      end
    end
  end
end