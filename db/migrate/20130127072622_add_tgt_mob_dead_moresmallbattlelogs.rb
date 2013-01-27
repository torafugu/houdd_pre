class AddTgtMobDeadMoresmallbattlelogs < ActiveRecord::Migration
  def change
    add_column :moresmallbattlelogs, :tgt_mob_dead, :boolean
  end
end
