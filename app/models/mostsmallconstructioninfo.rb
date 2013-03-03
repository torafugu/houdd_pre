class Mostsmallconstructioninfo < ActiveRecord::Base
  belongs_to :mostsmallconstructionfamily
  has_many :mostsmallconstproducts, :dependent => :delete_all
end
