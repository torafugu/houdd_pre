class Mostsmallterrainproduct < ActiveRecord::Base
  belongs_to :mostsmallterrain
  belongs_to :mostsmallresource

  def amount_per_cycle
    return read_attribute(:amount) / read_attribute(:cycle)
  end
end
