class Smalltrialturn < ActiveRecord::Base
  belongs_to :smalltrial
  has_many :smallturnsquadtrails, :dependent => :delete_all
  has_many :smallturnmobstatuses, :dependent => :delete_all
  has_many :smallturnbattlelogs, :dependent => :delete_all
end
