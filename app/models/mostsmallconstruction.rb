class Mostsmallconstruction < ActiveRecord::Base
  belongs_to :mostsmallterritory
  belongs_to :mostsmallconstructioninfo

  def prod_resource(resource_id)
    prod_resource = 0
    mostsmallconstructioninfo.mostsmallconstproducts.each do |prod|
      if prod.mostsmallresource_id == resource_id and prod.level == read_attribute(:level) 
        prod_resource += prod.amount
      end
    end
    return prod_resource
  end

  def is_completed
    if read_attribute(:remaining_period) == 0
      return true
    else
      return false
    end
  end
end
