class Mostsmallmob < ActiveRecord::Base
  belongs_to :mostsmallmobgene
  belongs_to :mostsmalljob
  belongs_to :mostsmalluser
  belongs_to :mostsmallsquad
  has_many :mostsmalleffects, :through => :mostsmallbattleeffectinventories
  has_many :mostsmallbattleeffectinventories, :dependent => :delete_all
  has_many :mostsmallitemequipinventories, :dependent => :delete_all

  attr_accessor :friends
  attr_accessor :enemies
  attr_accessor :vpos
  attr_accessor :ss_dex
  attr_accessor :hate

  class ActInfo
    def initialize(info)
      @name = info.name
      @num_of_tgt = info.num_of_tgt
      @accuracy = info.accuracy
      @range = info.range
      @damage = info.damage
    end
    attr_accessor :name
    attr_accessor :num_of_tgt
    attr_accessor :accuracy
    attr_accessor :range
    attr_accessor :damage
    attr_accessor :sp
    attr_accessor :target_mobs
    attr_accessor :effect
    def select_targets(targets)
      target_num = @num_of_tgt
      target_num = targets.length if targets.length < target_num
      @target_mobs = targets.values_at(0..target_num - 1)
    end
  end

  def uname
    mostsmalluser.name + "/" + read_attribute(:name) + "/" + mostsmalljob.name
  end

  def specie_name
    return mostsmallmobgene.mostsmallmobspecie.name
  end

  def ac
    slot_ac = mostsmallmobgene.mostsmallmobspecie.mostsmallequipslots.inject(0) {|sum, i| sum += i.ac }
    item_ac = mostsmallitemequipinventories.inject(0) {|sum, i| sum += i.ac }
    return slot_ac + item_ac
  end

  def max_hp
    return con
  end

  def max_sp
    return int
  end

  def con
    con = read_attribute(:con)
    mostsmallbattleeffectinventories.each do |battle_effect|
      con += battle_effect.mostsmalleffect.con_mod if 0 < battle_effect.remaining_duration
    end
    return con
  end

  def int
    int = read_attribute(:int)
    mostsmallbattleeffectinventories.each do |battle_effect|
      int += battle_effect.mostsmalleffect.int_mod if 0 < battle_effect.remaining_duration
    end
    return int
  end

  def dex
    dex = read_attribute(:dex)
    mostsmallbattleeffectinventories.each do |battle_effect|
      dex += battle_effect.mostsmalleffect.dex_mod if 0 < battle_effect.remaining_duration
    end
    return dex 
  end

  def dead?
    return true if read_attribute(:hp) == 0
    return false
  end

  def heal_needed?
    return true if read_attribute(:hp) < max_hp
    return false
  end

  def retreated?
    return true if @vpos < Mostsmallparams::START_LINE or @vpos > Mostsmallparams::END_LINE
    return false
  end

  def defender?
    return @is_defender
  end

  def is_defender=(is_defender)
    return @is_defender = is_defender
  end

  def warrior?
    return true unless Mostsmallparams::WARRIOR_JOB_IDS.index(mostsmalljob.id).nil?
    return false
  end
  
  def healer?
    return true unless Mostsmallparams::HEALER_JOB_IDS.index(mostsmalljob.id).nil?
    return false
  end

  def wizard?
    return true unless Mostsmallparams::WIZARD_JOB_IDS.index(mostsmalljob.id).nil?
    return false
  end

  def thief?
    return true unless Mostsmallparams::THIEF_JOB_IDS.index(mostsmalljob.id).nil?
    return false
  end

  def act?
    return true if not dead? and rand(10000) <= @ss_dex
    return false
  end

  def wepons_in_range
    act_infos = Array.new
    hands = mostsmallmobgene.mostsmallmobspecie.mostsmallequipslots.find_all_by_is_hand(true)
    hand_equips = mostsmallitemequipinventories.find_all_by_mostsmallequipslot_id(hands)
    hand_equips.each do |equip|
      targets = enemies_in_range(equip.mostsmallitem.mostsmalliteminfo)
      next if targets.blank?
      act_info = ActInfo.new(equip.mostsmallitem.mostsmalliteminfo)
      act_info.sp = 0
      act_info.select_targets(targets)
      act_info.effect = equip.mostsmallitem.mostsmalliteminfo.mostsmalleffects.first
      act_infos << act_info
    end
    if act_infos.empty?
      hands.each do |hand|
        targets = enemies_in_range(hand)
        next if targets.blank?
        act_info = ActInfo.new(hand)
        act_info.sp = 0
        act_info.select_targets(targets)
        act_infos << act_info
      end
    end
    sorted_by_range_wepons = act_infos.sort{|a,b|
      a.range <=> b.range
    }
    return sorted_by_range_wepons
  end

  def attack_skills_in_range
    act_infos = Array.new
    mostsmalljob.mostsmallskills.each do |skill|
      if read_attribute(:sp) > skill.sp_cost and Mostsmallparams::ATTACK_SKILL_CATEGORY_IDS.index(skill.mostsmallskillcategory.id) and read_attribute(:job_level) >= skill.job_level
        targets = enemies_in_range(skill)
        next if targets.blank?
        act_info = ActInfo.new(skill)
        act_info.sp = skill.sp_cost
        act_info.select_targets(targets)
        act_info.effect = skill.mostsmalleffects.first
        act_infos << act_info
      end
    end
    return act_infos
  end

  def heal_skills_in_range
    act_infos = Array.new
    mostsmalljob.mostsmallskills.each do |skill|
      if read_attribute(:sp) > skill.sp_cost and Mostsmallparams::HEAL_SKILL_CATEGORY_IDS.index(skill.mostsmallskillcategory.id) and read_attribute(:job_level) >= skill.job_level
        targets = friends_in_range(skill)
        next if targets.blank?
        heal_needed_targets = Array.new
        targets.each do |target|
          heal_needed_targets << target if target.heal_needed?
        end
        act_info = ActInfo.new(skill)
        act_info.sp = skill.sp_cost
        act_info.select_targets(heal_needed_targets)
        act_info.effect = skill.mostsmalleffects.first
        act_infos << act_info
      end
    end
    return act_infos
  end

  def status_up_skill
    mostsmalljob.mostsmallskills.each do |skill|
      if read_attribute(:sp) > skill.sp_cost and skill.mostsmallskillcategory.id == Mostsmallparams::STATUS_UP_SKILL_CATEGORY_ID
        act_info = ActInfo.new(skill)
        act_info.sp = skill.sp_cost
        act_info.effect = skill.mostsmalleffects.first
        return act_info
      end
    end
    return false
  end

  def fighting_will?
    retreat_hp_rate = Mostsmallparams::OTHER_RETREAT_HP_RATE
    if healer?
      retreat_hp_rate = Mostsmallparams::HEALER_RETREAT_HP_RATE
    elsif wizard?
      retreat_hp_rate = Mostsmallparams::WIZARD_RETREAT_HP_RATE
    end
    return false if read_attribute(:hp) < max_hp * retreat_hp_rate
    return true
  end

  def vpos_move
    move_backward unless fighting_will?
    if healer? and heal_skills_in_range.blank?
      move_forward
    elsif wizard? and attack_skills_in_range.blank?
      move_forward
    elsif wepons_in_range.blank?
      move_forward
    end
  end

  private

  def enemies_in_range(act_info)
    enemies_in_range = Array.new
    @enemies.each do |enemy|
      enemies_in_range << enemy if act_info.range >= (enemy.vpos - @vpos).abs and not enemy.dead? and not enemy.retreated?
    end
    sorted_enemies_in_range = enemies_in_range.sort{|a,b|
      b.hate <=> a.hate
    }
    return sorted_enemies_in_range
  end

  def friends_in_range(act_info)
    friends_in_range = Array.new
    @friends.each do |friend|
      friends_in_range << friend if act_info.range >= (friend.vpos - @vpos).abs and not friend.dead? and not friend.retreated?
    end
    sorted_friends_in_range = friends_in_range.sort{|a,b|
      a.hp <=> b.hp
    }
  end

  def move_forward
    if defender?
      @vpos -= 1 unless @vpos == Mostsmallparams::START_LINE
    else
      @vpos += 1 unless @vpos == Mostsmallparams::END_LINE
    end
  end

  def move_backward
    if defender?
      @vpos += 1
    else
      @vpos -= 1
    end
  end
end
