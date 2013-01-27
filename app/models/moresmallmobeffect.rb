class Moresmallmobeffect < ActiveRecord::Base
  belongs_to :moresmallmob
  belongs_to :moresmallmagicinfo

  def avg_DoT_dmg
    return moresmallmagicinfo.avg_DoT_dmg
  end

  def avg_HoT_heal
    return moresmallmagicinfo.avg_HoT_heal
  end
end
