class Mostsmalltraplvltbl < ActiveRecord::Base
  belongs_to :mostsmalltrapinfo

  def name
    return mostsmalltrapinfo.name + ":" + read_attribute(:level).to_s
  end
end
