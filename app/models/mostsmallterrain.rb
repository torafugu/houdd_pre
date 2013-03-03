class Mostsmallterrain < ActiveRecord::Base
  has_many :mostsmallterrainproducts, :dependent => :delete_all

  def prod_resource(resource_id)
    prod_resource = 0
    mostsmallterrainproducts.each do |prod|
      prod_resource += prod.amount if prod.mostsmallresource_id == resource_id
    end
    return prod_resource
  end
end
