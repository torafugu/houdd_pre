class MediumItemInfo < ActiveRecord::Base
  belongs_to :medium_body_part
  belongs_to :medium_atk_info
  belongs_to :medium_status_mod
  has_many :medium_items

  def wepon?
    return Consts::ITEM_WEPON_SYMBOLS.include?(read_attribute(:item_category_sym))
  end

  def armor?
    return Consts::ITEM_ARMOR_SYMBOLS.include?(read_attribute(:item_category_sym))
  end

  def x_range?
    return Consts::ITEM_XRANGE_SYMBOLS.include?(read_attribute(:item_category_sym))
  end
end
