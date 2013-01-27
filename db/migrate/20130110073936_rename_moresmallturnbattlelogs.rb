class RenameMoresmallturnbattlelogs < ActiveRecord::Migration
  def change
    rename_table :moresmallturnbattlelogs, :moresmallbattlelogs
  end
end
