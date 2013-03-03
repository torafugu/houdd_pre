class AddIndexMostsmallconstructionfamilyIdMostsmallconstructioninfo < ActiveRecord::Migration
  def change
    add_index :mostsmallconstructioninfos, :mostsmallconstructionfamily_id, :name => "index_constructionfamilies_on_mostsmallconstructioninfo"
  end
end
