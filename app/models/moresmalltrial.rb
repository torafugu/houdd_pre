class Moresmalltrial < ActiveRecord::Base
  belongs_to :moresmallmap
  belongs_to :moresmalltrialstatus
  belongs_to :def_mobunit, :class_name => 'Moresmallmobunit', :foreign_key => 'def_mobunit_id'
  belongs_to :atk_mobunit, :class_name => 'Moresmallmobunit', :foreign_key => 'atk_mobunit_id'
  has_many :moresmalltrialturns, :dependent => :delete_all
  has_many :moresmalltrialsquadperss, :dependent => :delete_all
end
