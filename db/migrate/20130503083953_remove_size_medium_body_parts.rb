class RemoveSizeMediumBodyParts < ActiveRecord::Migration
  def change
    remove_column :medium_body_parts, :size
  end
end
