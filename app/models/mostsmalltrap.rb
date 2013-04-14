class Mostsmalltrap < ActiveRecord::Base
  belongs_to :mostsmalltrapinfo
  belongs_to :mostsmallterritory

  def name
    return mostsmalltrapinfo.name + " " + mostsmallterritory.name + " X:" + read_attribute(:dungeon_x).to_s + " Y:" + read_attribute(:dungeon_y).to_s
  end

  def completed?
    if read_attribute(:remaining_period) == 0
      return true
    else
      return false
    end
  end

  def active?
    return true if completed? and read_attribute(:dp) > 0
    return false
  end
end
