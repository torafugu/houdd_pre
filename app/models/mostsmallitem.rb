class Mostsmallitem < ActiveRecord::Base
  belongs_to :mostsmalliteminfo
  belongs_to :mostsmalluser

  def name
  	return mostsmalluser.name + "/" + mostsmalliteminfo.name + read_attribute(:id).to_s
  end
end
