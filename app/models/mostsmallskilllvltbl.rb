class Mostsmallskilllvltbl < ActiveRecord::Base
  belongs_to :mostsmallskill

  def name
    return mostsmallskill.name + ":" + read_attribute(:level).to_s
  end
end
