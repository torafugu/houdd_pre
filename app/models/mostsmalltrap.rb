class Mostsmalltrap < ActiveRecord::Base
  belongs_to :mostsmalltrapinfo
  belongs_to :mostsmallterritory

  def is_completed
    if read_attribute(:remaining_period) == 0
      return true
    else
      return false
    end
  end
end
