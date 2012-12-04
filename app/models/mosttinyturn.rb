class Mosttinyturn < ActiveRecord::Base
  belongs_to :mosttinytrial
  has_many :mosttinymobtrails
  has_many :mosttinybattles
end
