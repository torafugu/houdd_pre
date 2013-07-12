class MediumBattleEffectInv < ActiveRecord::Base
  belongs_to :medium_mob
  belongs_to :medium_status_mod
  belongs_to :caused_mob, :class_name => 'MediumMob', :foreign_key => 'caused_mob_id'
end
