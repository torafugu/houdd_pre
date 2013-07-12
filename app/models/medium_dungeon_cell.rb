class MediumDungeonCell < ActiveRecord::Base
  belongs_to :medium_dungeon
  belongs_to :medium_squad
  belongs_to :trap, :class_name => 'MediumItem', :foreign_key => 'trap_id'
  has_many :medium_tc_item_invs
end
