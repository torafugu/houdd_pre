class Mostsmalliteminfo < ActiveRecord::Base
  belongs_to :mostsmallitemcategory
  belongs_to :mostsmallelement
  belongs_to :mostsmallmobspecie
  has_many :mostsmalleffects, :through => :mostsmallitemeffectinventories
  has_many :mostsmallitemeffectinventories, :dependent => :delete_all
end
