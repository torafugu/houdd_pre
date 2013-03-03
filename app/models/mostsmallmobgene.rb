class Mostsmallmobgene < ActiveRecord::Base
  belongs_to :mostsmallmobspecie
  belongs_to :mothermobgene, :class_name => 'Mostsmallmobgene', :foreign_key => 'mothermobgene_id'
  belongs_to :fathermobgene, :class_name => 'Mostsmallmobgene', :foreign_key => 'fathermobgene_id'
end
