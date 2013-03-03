class Mostsmallitem < ActiveRecord::Base
  belongs_to :mostsmalliteminfo
  belongs_to :mostsmalluser

  def name
  	return mostsmalliteminfo.name
  end
end
