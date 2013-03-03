class Mostsmallitemequipinventory < ActiveRecord::Base
  belongs_to :mostsmallitem
  belongs_to :mostsmallmob
  belongs_to :mostsmallequipslot
end
