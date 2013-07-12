class MediumItem < ActiveRecord::Base
  belongs_to :medium_item_info
  belongs_to :medium_houdd_user
  has_one :medium_item_equip_inv

  def quality_txt
    quality_txt = read_attribute(:quality).to_s
    quality_txt = "+" + read_attribute(:quality).to_s if read_attribute(:quality) >= 0
    return quality_txt
  end

  def info_name
    return medium_item_info.name
  end

  def name
    return medium_item_info.name + quality_txt
  end

  def medium_atk_info
    return medium_item_info.medium_atk_info
  end

  def num_of_tgt
    return medium_item_info.num_of_tgt
  end

  def broken?
    return true if read_attribute(:dp) == 0
    return false
  end
end
