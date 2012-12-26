class RenameIsGuardSmalltrialmoblineups < ActiveRecord::Migration
  def change
    rename_column(:smalltrialmoblineups, :is_completed, :is_guard)
  end
end
