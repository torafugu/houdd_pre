class DropSmalltrialmoblogsAndSmalltrialbattlelogs < ActiveRecord::Migration
  def change
    drop_table :smalltrialbattlelogs
    drop_table :smalltrialmoblogs
  end
end
