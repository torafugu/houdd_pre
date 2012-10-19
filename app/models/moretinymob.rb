class Moretinymob < ActiveRecord::Base
  belongs_to :moretinymobinfo
  has_many :moretinymobtrails
end
