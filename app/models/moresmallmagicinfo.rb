class Moresmallmagicinfo < ActiveRecord::Base
  def avg_DoT_dmg
    return 0 if read_attribute(:duration) == 0
    return read_attribute(:amt_dmg) / read_attribute(:duration)
  end

  def avg_HoT_heal
    return 0 if read_attribute(:duration) == 0
    return read_attribute(:amt_heal) / read_attribute(:duration)
  end
end
