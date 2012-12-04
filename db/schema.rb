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

ActiveRecord::Schema.define(:version => 20121203011340) do

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

  create_table "mosttinybattles", :force => true do |t|
    t.integer  "mosttinyturn_id"
    t.integer  "src_mobsetup_id"
    t.integer  "tgt_mobsetup_id"
    t.integer  "damage_to_tgt"
    t.text     "log"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.integer  "tgt_mob_current_hp"
    t.boolean  "is_tgt_mob_dead"
    t.integer  "tgt_mob_x"
    t.integer  "tgt_mob_y"
  end

  add_index "mosttinybattles", ["mosttinyturn_id"], :name => "index_mosttinybattles_on_mosttinyturn_id"

  create_table "mosttinymaps", :force => true do |t|
    t.integer  "mosttinyuser_id"
    t.string   "name"
    t.integer  "prev_map_id"
    t.text     "map"
    t.integer  "category"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "mosttinymaps", ["mosttinyuser_id"], :name => "index_mosttinymaps_on_mosttinyuser_id"

  create_table "mosttinymobinfos", :force => true do |t|
    t.string   "name"
    t.integer  "category"
    t.integer  "hp"
    t.integer  "def"
    t.integer  "agi"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "high_atk"
    t.integer  "low_atk"
  end

  create_table "mosttinymobs", :force => true do |t|
    t.string   "name"
    t.integer  "mosttinyuser_id"
    t.integer  "mosttinymobinfo_id"
    t.integer  "hp"
    t.boolean  "is_dead"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.boolean  "is_assigned"
  end

  add_index "mosttinymobs", ["mosttinymobinfo_id"], :name => "index_mosttinymobs_on_mosttinymobinfo_id"
  add_index "mosttinymobs", ["mosttinyuser_id"], :name => "index_mosttinymobs_on_mosttinyuser_id"

  create_table "mosttinymobsetups", :force => true do |t|
    t.integer  "mosttinymob_id"
    t.integer  "start_x"
    t.integer  "start_y"
    t.integer  "distance"
    t.boolean  "is_guard"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "mosttinytrial_id"
    t.integer  "current_x"
    t.integer  "current_y"
  end

  add_index "mosttinymobsetups", ["mosttinymob_id"], :name => "index_mosttinymobsetups_on_mosttinymob_id"
  add_index "mosttinymobsetups", ["mosttinytrial_id"], :name => "index_mosttinymobsetups_on_mosttinytrial_id"

  create_table "mosttinymobtrails", :force => true do |t|
    t.integer  "mosttinyturn_id"
    t.text     "trail"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.integer  "mosttinymobsetup_id"
    t.integer  "from_x"
    t.integer  "from_y"
    t.integer  "to_x"
    t.integer  "to_y"
  end

  add_index "mosttinymobtrails", ["mosttinymobsetup_id"], :name => "index_mosttinymobtrails_on_mosttinymobsetup_id"
  add_index "mosttinymobtrails", ["mosttinyturn_id"], :name => "index_mosttinymobtrails_on_mosttinyturn_id"

  create_table "mosttinystrategies", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "mosttinytrials", :force => true do |t|
    t.integer  "def_user_id"
    t.integer  "map_id"
    t.integer  "atk_user_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "def_strategy_id"
    t.integer  "atk_strategy_id"
    t.boolean  "is_completed"
  end

  add_index "mosttinytrials", ["atk_user_id"], :name => "index_mosttinytrials_on_atk_user_id"
  add_index "mosttinytrials", ["def_user_id"], :name => "index_mosttinytrials_on_def_user_id"

  create_table "mosttinyturns", :force => true do |t|
    t.integer  "mosttinytrial_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.text     "log"
  end

  add_index "mosttinyturns", ["mosttinytrial_id"], :name => "index_mosttinyturns_on_mosttinytrial_id"

  create_table "mosttinyusers", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tinymaps", :force => true do |t|
    t.string   "name"
    t.text     "map"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
