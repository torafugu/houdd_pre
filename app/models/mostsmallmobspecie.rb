class Mostsmallmobspecie < ActiveRecord::Base
  has_many :mostsmallmobgenes, :dependent => :delete_all
  has_many :mostsmallspeciejobinventories, :dependent => :delete_all
  has_many :mostsmallequipslots, :through => :mostsmallequipslotinventories
  has_many :mostsmallequipslotinventories
end
