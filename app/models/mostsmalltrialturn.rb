class Mostsmalltrialturn < ActiveRecord::Base
  belongs_to :mostsmalltrial
  has_many :mostsmallsquadtrails, :dependent => :delete_all
  has_many :mostsmallmobstatuses, :dependent => :delete_all
  has_many :mostsmallbattlesets, :dependent => :delete_all
end
