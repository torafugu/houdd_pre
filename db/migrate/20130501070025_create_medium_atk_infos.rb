class CreateMediumAtkInfos < ActiveRecord::Migration
  def change
    create_table :medium_atk_infos do |t|
      t.string :name
      t.integer :hit_accuracy
      t.integer :d_range
      t.integer :x_range
      t.integer :inst_damage
      t.integer :ovtm_damage

      t.timestamps
    end
  end
end
