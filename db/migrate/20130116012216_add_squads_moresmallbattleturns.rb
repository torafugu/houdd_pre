class AddSquadsMoresmallbattleturns < ActiveRecord::Migration
  def change
    add_column :moresmallbattleturns, :src_squad_id, :integer
    add_column :moresmallbattleturns, :tgt_squad_id, :integer
  end
end
