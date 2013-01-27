class Moresmallmob < ActiveRecord::Base
  belongs_to :moresmallmobinfo
  belongs_to :moresmalluser
  belongs_to :moresmallmobsquad
  has_many :moresmallarmorinfos, :through => :moresmallarmorinventories
  has_many :moresmallarmorinventories
  accepts_nested_attributes_for :moresmallarmorinventories
  has_many :moresmallweponinfos, :through => :moresmallweponinventories
  has_many :moresmallweponinventories
  accepts_nested_attributes_for :moresmallweponinventories
  has_many :moresmallmobeffects

  END_LINE = 5
  START_LINE = 1

  def info_name
    return moresmallmobinfo.name
  end

  def max_hp
    return moresmallmobinfo.max_hp
  end

  def max_mp
    return moresmallmobinfo.max_mp
  end

  def str
    return moresmallmobinfo.str
  end

  def dex
    return moresmallmobinfo.dex
  end

  def int
    return moresmallmobinfo.int
  end

  def wis
    return moresmallmobinfo.wis
  end

  def magicinfos
    return moresmallmobinfo.moresmallmagicinfos
  end

  def weponinfos
    return moresmallweponinfos
  end

  def armorinfos
    return moresmallarmorinfos
  end

  def dead?
    return true if read_attribute(:hp) == 0
    return false
  end

  def dex_roll
    @dex_roll = rand(moresmallmobinfo.dex + 1) if @dex_roll.blank?
    return @dex_roll
  end

  def act_interval
    return @act_interval
  end

  def act_interval=(act_interval)
    return @act_interval = act_interval
  end

  def defender?
    return @is_defender
  end

  def is_defender=(is_defender)
    return @is_defender = is_defender
  end

  def friends
    return @friends
  end

  def friends=(friends)
    return @friends = friends
  end

  def enemies
    return @enemies
  end

  def enemies=(enemies)
    return @enemies = enemies
  end

  def vpos
    return @vpos
  end

  def vpos=(vpos)
    return @vpos = vpos
  end

  def move
    if healer?
      if read_attribute(:hp) < max_hp * 0.4
        move_backward
      elsif not can_heal? and not can_physical_attack?
        move_forward
      end
    elsif wizard?
      if read_attribute(:hp) < max_hp * 0.6
        move_backward
      elsif not can_magical_attack? and not can_physical_attack?
        move_forward
      end
    else
      unless can_physical_attack?
        move_forward
      end
    end
  end

  def can_physical_attack?
    range = moresmallweponinfos.first.range
    @enemies.each do |mob|
      return true if range >= (mob.vpos - vpos).abs and not mob.dead?
    end
    return false
  end

  def can_magical_attack?
    if read_attribute(:mp) >= magicinfos.first.mp_cost
      @enemies.each do |mob|
        return true unless mob.dead?
      end
    end
    return false
  end

  def has_HoT?
    return false if moresmallmobeffects.blank?
    moresmallmobeffects.each do |effect|
      return true if effect.moresmallmagicinfo.category_id == 102
    end
    return false
  end

  def has_DoT?
    return false if moresmallmobeffects.blank?
    moresmallmobeffects.each do |effect|
      return true if effect.moresmallmagicinfo.category_id == 2
    end
    return false
  end

  def healer?
    return true if (moresmallmobinfo.category_id == 3 or moresmallmobinfo.category_id == 4)
    return false
  end

  def can_heal?
    if healer? and read_attribute(:mp) >= magicinfos.first.mp_cost
      @friends.each do |mob|
        return true if mob.hp < mob.max_hp and not mob.dead?
      end
    end
    return false
  end

  def wizard?
    return true if (moresmallmobinfo.category_id == 2 or moresmallmobinfo.category_id == 5)
    return false
  end

  private

  def move_forward
    if defender?
      @vpos -= 1 unless @vpos == START_LINE
    else
      @vpos += 1 unless @vpos == END_LINE
    end
  end

  def move_backward
    if defender?
      @vpos += 1 unless @vpos == END_LINE
    else
      @vpos -= 1 unless @vpos == START_LINE
    end
  end
end
