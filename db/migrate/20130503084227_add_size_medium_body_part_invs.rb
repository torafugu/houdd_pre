class AddSizeMediumBodyPartInvs < ActiveRecord::Migration
  def change
    add_column :medium_body_part_invs, :size, :integer
  end
end
