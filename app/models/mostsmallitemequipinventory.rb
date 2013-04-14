class Mostsmallitemequipinventory < ActiveRecord::Base
  belongs_to :mostsmallitem
  belongs_to :mostsmallmob
  belongs_to :mostsmallequipslot

  def ac
    return mostsmallitem.mostsmalliteminfo.ac
  end
end
