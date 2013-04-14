class Mostsmalltrialsquad < ActiveRecord::Base
  belongs_to :mostsmalltrial
  has_many :mostsmalltrialmobs, :dependent => :delete_all
end
