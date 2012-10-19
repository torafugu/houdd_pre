# coding: utf-8

class Moretinymobbattlecreator

  def Moretinymobbattlecreator.create(trail_step, intrudermob, guardmob)
    puts trail_step
    while guardmob.hp > 0 and intrudermob.hp > 0
      
      damage_to_me = rand(3) + 1 + guardmob.moretinymobinfo.str
      battlelog_of_me = guardmob.name + "が" + intrudermob.name + "に対して" + damage_to_me.to_s + "のダメージ。\n"
      intrudermob.hp -= damage_to_me 

      damage_to_tgt = rand(4) + 1 + intrudermob.moretinymobinfo.str
      battlelog_of_tgt = intrudermob.name + "が" + guardmob.name + "に対して" + damage_to_tgt.to_s + "のダメージ。\n"
      guardmob.hp -= damage_to_tgt
      if intrudermob.hp <= 0
        deathlog_of_me = intrudermob.name + "は死んだ。\n"
        intrudermob.is_dead = true
      else
        deathlog_of_me = ""
      end
      if guardmob.hp <= 0
        deathlog_of_tgt = guardmob.name + "は死んだ。\n"
        guardmob.is_dead = true
      else
        deathlog_of_tgt = ""
      end
      print battlelog_of_me
      print battlelog_of_tgt
      print deathlog_of_me
      print deathlog_of_tgt
      
      moretinymobbattle = Moretinymobbattle.new
      moretinymobbattle.trail_step = trail_step
      moretinymobbattle.log = battlelog_of_me + battlelog_of_tgt + deathlog_of_me + deathlog_of_tgt
      moretinymobbattle.tgt_mob_id = guardmob.id
      moretinymobbattle.damage_to_me = damage_to_me
      moretinymobbattle.damage_to_tgt = damage_to_tgt
      moretinymobbattle.save
    end
    intrudermob.save
    guardmob.save
  end
end

