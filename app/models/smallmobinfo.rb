class Smallmobinfo < ActiveRecord::Base
  has_many :smallmagicinfos, :through => :smallmagicinventories
  has_many :smallmagicinventories
  accepts_nested_attributes_for :smallmagicinventories
end
