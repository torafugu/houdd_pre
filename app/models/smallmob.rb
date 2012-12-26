class Smallmob < ActiveRecord::Base
  belongs_to :smallmobinfo
  belongs_to :smalluser
  belongs_to :smallmobsquad
  has_many :smallarmorinfos, :through => :smallarmorinventories
  has_many :smallarmorinventories
  accepts_nested_attributes_for :smallarmorinventories
  has_many :smallweponinfos, :through => :smallweponinventories
  has_many :smallweponinventories
  accepts_nested_attributes_for :smallweponinventories

  def info_name
    return smallmobinfo.name
  end

  def max_hp
    return smallmobinfo.max_hp
  end

  def max_mp
    return smallmobinfo.max_mp
  end

  def high_atk
    return smallmobinfo.high_atk
  end

  def low_atk
    return smallmobinfo.low_atk
  end

  def def
    return smallmobinfo.def
  end

  def agi
    return smallmobinfo.agi
  end

  def dead?
    return true if read_attribute(:hp) == 0
    return false
  end

  def agi_roll
    @agi_roll = rand(smallmobinfo.agi + 1) if @agi_roll.blank?
    return @agi_roll
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

  def healer?
    return true if smallmobinfo.category_id == 3
    return false
  end

  def wizard?
    return true if smallmobinfo.category_id == 2
    return false
  end
end
