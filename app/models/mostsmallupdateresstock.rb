class Mostsmallupdateresstock
  def self.execute
    res_stocks = Mostsmallresstock.all
    for res_stock in res_stocks
      res_stock.amount += res_stock.prod_resource_terrain
      res_stock.amount += res_stock.prod_resource_construction
      res_stock.save
    end
  end
end
