class Moresmalltrialsquadpers < ActiveRecord::Base
  belongs_to :moresmalltrial
  has_many :moresmalltrialmobperss, :dependent => :delete_all
end
