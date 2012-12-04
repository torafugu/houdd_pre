# coding: utf-8

class Mosttinybattlecreator

  def self.create_by_id(turn_id, src_mob_id, tgt_mob_id)

    src_mob = Mosttinymobsetup.find(src_mob_id, :include => {:mosttinymob => :mosttinymobinfo})
    tgt_mob = Mosttinymobsetup.find(tgt_mob_id, :include => {:mosttinymob => :mosttinymobinfo})
    create(turn_id, src_mob, tgt_mob)
  end

  def self.create(turn_id, src_mob, tgt_mob)

    # Settle initiative
    source_agi = src_mob.mosttinymob.mosttinymobinfo.agi
    target_agi = tgt_mob.mosttinymob.mosttinymobinfo.agi
    
    is_source_has_initiative = true
    source_initiative_roll = rand(source_agi)
    target_initiative_roll = rand(target_agi)
    is_source_has_initiative = false if target_initiative_roll > source_initiative_roll 
    p is_source_has_initiative 

    # Calculate attack interval
    lcm_of_source_and_target = source_agi.lcm(target_agi)
    source_attack_interval = lcm_of_source_and_target / source_agi
    target_attack_interval = lcm_of_source_and_target / target_agi

    p source_attack_interval
    p target_attack_interval 

    phase = 0
    until src_mob.mosttinymob.is_dead or tgt_mob.mosttinymob.is_dead
      #src_mob.mosttinymob.is_dead = true
      p 'Phase:' + phase.to_s

      if phase == 0
        attack(turn_id, src_mob, tgt_mob) if is_source_has_initiative
        attack(turn_id, tgt_mob, src_mob) unless is_source_has_initiative
      else
        attack(turn_id, src_mob, tgt_mob) if phase % source_attack_interval == 0
        attack(turn_id, tgt_mob, src_mob) if phase % target_attack_interval == 0
      end
      
      tgt_mob.mosttinymob.is_dead = true if phase == 20

      phase += 1 
    end
  end

  def self.attack(turn_id, src_mob, tgt_mob)

    src_mob_info = src_mob.mosttinymob.mosttinymobinfo
    tgt_mob_info = tgt_mob.mosttinymob.mosttinymobinfo

    damage_original = rand(src_mob_info.high_atk - src_mob_info.low_atk) + src_mob_info.low_atk
    damage_to_tgt = damage_original - tgt_mob_info.def
    damage_to_tgt = 1 if damage_to_tgt < 1
    log = src_mob.mosttinymob.name + 'が' + tgt_mob.mosttinymob.name + 'に' + damage_to_tgt.to_s + "のダメージ。\n"
    tgt_mob.mosttinymob.hp -= damage_to_tgt
    is_tgt_mob_just_dead = false
    if tgt_mob.mosttinymob.hp < 1
      tgt_mob.mosttinymob.is_dead = true
      is_tgt_mob_just_dead = true
      log += tgt_mob.mosttinymob.name + "は死んだ。"
    end
    
    battle = Mosttinybattle.new
    battle.mosttinyturn_id = turn_id
    battle.src_mobsetup_id = src_mob.id
    battle.tgt_mobsetup_id = tgt_mob.id
    battle.damage_to_tgt = damage_to_tgt
    battle.tgt_mob_current_hp = tgt_mob.mosttinymob.hp
    battle.is_tgt_mob_dead = is_tgt_mob_just_dead
    battle.tgt_mob_x = tgt_mob.from_point["x"]
    battle.tgt_mob_y = tgt_mob.from_point["y"]
    battle.log = log
    battle.save
    tgt_mob.mosttinymob.save
  end
end
