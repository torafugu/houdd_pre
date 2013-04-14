class Mostsmallbattleturn < ActiveRecord::Base
  belongs_to :mostsmallbattleset
  has_many :mostsmallbattlelogs, :dependent => :delete_all
end
