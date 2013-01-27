class AddVposMoresmallbattlelogs < ActiveRecord::Migration
  def change
    add_column :moresmallbattlelogs, :src_mob_vpos, :integer
    add_column :moresmallbattlelogs, :tgt_mob_vpos, :integer
  end
end
