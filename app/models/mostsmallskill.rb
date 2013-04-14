class Mostsmallskill < ActiveRecord::Base
  belongs_to :mostsmallskillcategory
  belongs_to :mostsmalljob
  belongs_to :mostsmallelement
  has_many :mostsmalleffects, :through => :mostsmallskilleffectinventories
  has_many :mostsmallskilleffectinventories, :dependent => :delete_all
end
