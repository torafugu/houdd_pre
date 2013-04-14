class Mostsmallitemcreator
  def self.create(iteminfo_id)
    iteminfo = Mostsmalliteminfo.find(iteminfo_id)
    item = Mostsmallitem.new
    item.dp = iteminfo.max_dp
    item.quality = Tools.gaussian_rand.truncate
    item.remaining_period = iteminfo.const_period
    return item
  end
end
