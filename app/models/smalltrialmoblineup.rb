class Smalltrialmoblineup < ActiveRecord::Base
  belongs_to :smalltrial
  belongs_to :mob, :class_name => 'Smallmob', :foreign_key => 'mob_id'

  def info_name
    return mob.info_name
  end

  def max_hp
    return mob.max_hp
  end

  def hp
    return mob.hp
  end

  def max_mp
    return mob.max_mp
  end

  def mp
    return mob.mp
  end

  def high_atk
    return mob.high_atk
  end

  def low_atk
    return mob.low_atk
  end

  def def
    return mob.def
  end

  def agi
    return mob.agi
  end
end
