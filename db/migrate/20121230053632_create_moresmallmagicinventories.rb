class CreateMoresmallmagicinventories < ActiveRecord::Migration
  def change
    create_table :moresmallmagicinventories do |t|
      t.references :moresmallmobinfo
      t.references :moresmallmagicinfo

      t.timestamps
    end
    add_index :moresmallmagicinventories, :moresmallmobinfo_id
    add_index :moresmallmagicinventories, :moresmallmagicinfo_id
  end
end
