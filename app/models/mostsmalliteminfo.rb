class Mostsmalliteminfo < ActiveRecord::Base
  belongs_to :mostsmallitemcategory
  belongs_to :mostsmallelement
  belongs_to :mostsmallmobspecie
end
