class Smalltrial < ActiveRecord::Base
  belongs_to :smallmap
  belongs_to :smalltrialstatus
  belongs_to :def_mobunit, :class_name => 'Smallmobunit', :foreign_key => 'def_mobunit_id'
  belongs_to :atk_mobunit, :class_name => 'Smallmobunit', :foreign_key => 'atk_mobunit_id'
  has_many :smalltrialturns, :dependent => :delete_all
  has_many :smalltrialmoblineups, :dependent => :delete_all
end
