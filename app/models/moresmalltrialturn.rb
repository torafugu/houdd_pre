class Moresmalltrialturn < ActiveRecord::Base
  belongs_to :moresmalltrial
  has_many :moresmallturnsquadtrails, :dependent => :delete_all
  has_many :moresmallturnmobstatuses, :dependent => :delete_all
  has_many :moresmallturnbattlelogs, :dependent => :delete_all
  has_many :moresmallbattleturns, :dependent => :delete_all
end
