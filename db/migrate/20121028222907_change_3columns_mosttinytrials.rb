class Change3columnsMosttinytrials < ActiveRecord::Migration
  def up
    remove_index :mosttinytrials, :mosttinyuser_id
    remove_column :mosttinytrials, :mosttinyuser_id
    add_index :mosttinytrials, :def_user_id
    add_index :mosttinytrials, :atk_user_id
    add_column :mosttinytrials, :def_strategy_id, :integer
    add_column :mosttinytrials, :atk_strategy_id, :integer
  end

  def down
    add_column :mosttinytrials, :mosttinyuser_id, :integer
    add_index :mosttinytrials, :mosttinyuser_id
    remove_index :mosttinytrials, :def_user_id
    remove_index :mosttinytrials, :atk_user_id
    remove_column :mosttinytrials, :def_strategy_id
    remove_column :mosttinytrials, :atk_strategy_id
  end
end
