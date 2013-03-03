class Mostsmallskill < ActiveRecord::Base
  belongs_to :mostsmallskillcategory
  belongs_to :mostsmalljob
  belongs_to :mostsmallelement
end
