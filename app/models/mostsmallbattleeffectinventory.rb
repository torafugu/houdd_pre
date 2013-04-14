class Mostsmallbattleeffectinventory < ActiveRecord::Base
  belongs_to :mostsmallmob
  belongs_to :mostsmalleffect
  belongs_to :src_mob, :class_name => 'Mostsmallmob', :foreign_key => 'src_mob_id'
end
