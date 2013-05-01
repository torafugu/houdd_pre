class MediumConstructionQue < ActiveRecord::Base
  belongs_to :medium_construction
  belongs_to :medium_map_cell
end
