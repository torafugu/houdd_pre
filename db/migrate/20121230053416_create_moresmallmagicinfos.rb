class CreateMoresmallmagicinfos < ActiveRecord::Migration
  def change
    create_table :moresmallmagicinfos do |t|
      t.string :name
      t.integer :category_id
      t.integer :inst_dmg
      t.integer :amt_dmg
      t.integer :inst_heal
      t.integer :amt_heal
      t.integer :duration
      t.integer :accuracy
      t.integer :range
      t.integer :mp_cost

      t.timestamps
    end
  end
end
