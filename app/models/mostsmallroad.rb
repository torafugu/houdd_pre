class Mostsmallroad < ActiveRecord::Base
  belongs_to :start_territory, :class_name => 'Mostsmallterritory', :foreign_key => 'start_territory_id'
  belongs_to :dest_territory, :class_name => 'Mostsmallterritory', :foreign_key => 'dest_territory_id'
end
