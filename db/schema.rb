# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121018080441) do

  create_table "moretinymaps", :force => true do |t|
    t.string   "name"
    t.integer  "type"
    t.text     "map"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "category"
  end

  create_table "moretinymobbattles", :force => true do |t|
    t.integer  "moretinymobtrail_id"
    t.integer  "trail_step"
    t.text     "log"
    t.integer  "tgt_mob_id"
    t.integer  "damage_to_me"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.integer  "damage_to_tgt"
  end

  add_index "moretinymobbattles", ["moretinymobtrail_id"], :name => "index_moretinymobbattles_on_moretinymobtrail_id"

  create_table "moretinymobinfos", :force => true do |t|
    t.string   "name"
    t.integer  "hp"
    t.integer  "str"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "category"
  end

  create_table "moretinymobs", :force => true do |t|
    t.string   "name"
    t.integer  "moretinymobinfo_id"
    t.integer  "moretinymap_id"
    t.integer  "start_x"
    t.integer  "start_y"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.boolean  "is_guard"
    t.boolean  "is_dead"
    t.integer  "hp"
    t.integer  "distance"
  end

  add_index "moretinymobs", ["moretinymap_id"], :name => "index_moretinymobs_on_moretinymap_id"
  add_index "moretinymobs", ["moretinymobinfo_id"], :name => "index_moretinymobs_on_moretinymobinfo_id"

  create_table "moretinymobtrails", :force => true do |t|
    t.integer  "moretinymob_id"
    t.text     "trail"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "tinymaps", :force => true do |t|
    t.string   "name"
    t.text     "map"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
