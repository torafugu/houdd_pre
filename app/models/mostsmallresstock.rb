class Mostsmallresstock < ActiveRecord::Base
  belongs_to :mostsmalluser
  belongs_to :mostsmallresource
  
  def prod_resource_terrain
    return mostsmalluser.prod_resource_terrain(mostsmallresource.id)
  end

  def prod_resource_construction
    return mostsmalluser.prod_resource_construction(mostsmallresource.id)
  end
end
