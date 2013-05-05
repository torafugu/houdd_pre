class MediumMobDna < ActiveRecord::Base
  belongs_to :medium_mob
  belongs_to :medium_gene
end
