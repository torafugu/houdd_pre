class MediumJob < ActiveRecord::Base
  has_many :medium_skills

  def healer?
    return true unless Consts::HEALER_JOB_IDS.index(read_attribute(:id)).nil?
    return false
  end

  def wizard?
    return true unless Consts::WIZARD_JOB_IDS.index(read_attribute(:id)).nil?
    return false
  end

  def thief?
    return true unless Consts::THIEF_JOB_IDS.index(read_attribute(:id)).nil?
    return false
  end
end
