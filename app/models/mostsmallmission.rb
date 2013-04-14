class Mostsmallmission < ActiveRecord::Base
  belongs_to :mostsmalluser
  belongs_to :mostsmallterritory
  belongs_to :mostsmallmissioncategory
  belongs_to :mostsmallstrategy
  has_many :mostsmallsquads, :through => :mostsmallmissioninventories
  has_many :mostsmallmissioninventories

  def name
    return mostsmallterritory.name + " " + mostsmallmissioncategory.name
  end
end
