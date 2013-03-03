class Mostsmallmob < ActiveRecord::Base
  belongs_to :mostsmallmobgene
  belongs_to :mostsmalljob
  belongs_to :mostsmalluser
  belongs_to :mostsmallsquad
end
