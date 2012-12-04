class Mosttinybattle < ActiveRecord::Base
  belongs_to :mosttinyturn
  belongs_to :src_mob, :class_name => 'Mosttinymobsetup', :foreign_key => 'src_mobsetup_id'
  belongs_to :tgt_mob, :class_name => 'Mosttinymobsetup', :foreign_key => 'tgt_mobsetup_id'
end
