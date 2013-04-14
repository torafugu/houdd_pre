class Mostsmallbattleset < ActiveRecord::Base
  belongs_to :mostsmalltrialturn
  has_many :mostsmallbattleturns, :dependent => :delete_all

  attr_accessor :atk_squad
  attr_accessor :def_squad

  def atk_squad_name
    return mostsmalltrialturn.mostsmalltrial.mostsmalltrialsquads.find_by_squad_id(read_attribute(:atk_squad_id)).squad_name
  end

  def def_squad_name
    return mostsmalltrialturn.mostsmalltrial.mostsmalltrialsquads.find_by_squad_id(read_attribute(:def_squad_id)).squad_name
  end
end
