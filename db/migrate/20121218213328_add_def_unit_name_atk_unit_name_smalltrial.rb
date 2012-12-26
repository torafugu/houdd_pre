class AddDefUnitNameAtkUnitNameSmalltrial < ActiveRecord::Migration
  def change
    add_column :smalltrials, :def_mobunit_name, :string
    add_column :smalltrials, :atk_mobunit_name, :string
  end
end
