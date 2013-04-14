class Mostsmalltreasurechest < ActiveRecord::Base
  belongs_to :mostsmallterritory
  has_many :mostsmalltreasureitems, :dependent => :delete_all

  def name
    return mostsmallterritory.name + " X:" + read_attribute(:dungeon_x).to_s + " Y:" + read_attribute(:dungeon_y).to_s
  end
end
