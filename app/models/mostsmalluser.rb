class Mostsmalluser < ActiveRecord::Base
  has_many :mostsmallterritories, :dependent => :delete_all
  has_many :mostsmallresstocks, :dependent => :delete_all
  has_many :mostsmallresearchlvls, :dependent => :delete_all

  def prod_resource_terrain(resource_id)
    prod_resource = 0
    mostsmallterritories.all.each do |terrirory|
      prod_resource += terrirory.prod_resource_terrain(resource_id)
    end
    return prod_resource
  end

  def prod_resource_construction(resource_id)
    prod_resource = 0
    mostsmallterritories.all.each do |terrirory|
      prod_resource += terrirory.prod_resource_construction(resource_id)
    end
    return prod_resource
  end
end
