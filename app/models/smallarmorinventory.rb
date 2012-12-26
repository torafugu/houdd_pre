class Smallarmorinventory < ActiveRecord::Base
  belongs_to :smallmob
  belongs_to :smallarmorinfo
end
