class Mostsmalltrapinfo < ActiveRecord::Base
  belongs_to :mostsmallelement
  has_many :mostsmalleffects, :through => :mostsmalltrapeffectinventories
  has_many :mostsmalltrapeffectinventories
end
