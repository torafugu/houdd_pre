class CreateMoresmallmobeffects < ActiveRecord::Migration
  def change
    create_table :moresmallmobeffects do |t|
      t.references :moresmallmob
      t.references :moresmallmagicinfo
      t.integer :duration

      t.timestamps
    end
    add_index :moresmallmobeffects, :moresmallmob_id
    add_index :moresmallmobeffects, :moresmallmagicinfo_id
  end
end
