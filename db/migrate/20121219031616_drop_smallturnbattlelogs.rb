class DropSmallturnbattlelogs < ActiveRecord::Migration
  def change
    drop_table :smallturnbattlelogs
  end
end
