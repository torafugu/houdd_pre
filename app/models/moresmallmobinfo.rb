class Moresmallmobinfo < ActiveRecord::Base
  has_many :moresmallmagicinfos, :through => :moresmallmagicinventories
  has_many :moresmallmagicinventories
  accepts_nested_attributes_for :moresmallmagicinventories
end
