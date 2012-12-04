class Mosttinymob < ActiveRecord::Base
  belongs_to :mosttinyuser
  belongs_to :mosttinymobinfo
  has_many :mosttinymobsetups
end
