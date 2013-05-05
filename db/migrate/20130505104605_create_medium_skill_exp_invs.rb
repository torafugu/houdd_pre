class CreateMediumSkillExpInvs < ActiveRecord::Migration
  def change
    create_table :medium_skill_exp_invs do |t|
      t.references :medium_mob
      t.references :medium_skill
      t.integer :level
      t.integer :exp

      t.timestamps
    end
    add_index :medium_skill_exp_invs, :medium_mob_id
    add_index :medium_skill_exp_invs, :medium_skill_id
  end
end
