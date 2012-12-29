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

ActiveRecord::Schema.define(:version => 20121228051051) do

  create_table "moresmallmaps", :force => true do |t|
    t.integer  "category_id"
    t.string   "name"
    t.text     "txt"
    t.integer  "start_trial_id"
    t.integer  "end_trial_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "moresmalluser_id"
  end

  add_index "moresmallmaps", ["moresmalluser_id"], :name => "index_moresmallmaps_on_moresmalluser_id"

  create_table "moresmallusers", :force => true do |t|
    t.string   "name"
    t.string   "login_id"
    t.string   "login_pw"
    t.datetime "first_login_at"
    t.datetime "last_login_at"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.boolean  "is_admin"
  end

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

  create_table "smallarmorinfos", :force => true do |t|
    t.string   "name"
    t.integer  "category_id"
    t.integer  "def"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "smallarmorinventories", :force => true do |t|
    t.integer  "smallmob_id"
    t.integer  "smallarmorinfo_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "smallarmorinventories", ["smallarmorinfo_id"], :name => "index_smallarmorinventories_on_smallarmorinfo_id"
  add_index "smallarmorinventories", ["smallmob_id"], :name => "index_smallarmorinventories_on_smallmob_id"

  create_table "smallmagicinfos", :force => true do |t|
    t.string   "name"
    t.integer  "category_id"
    t.integer  "high_heal"
    t.integer  "high_damage"
    t.integer  "mp_cost"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "low_heal"
    t.integer  "low_damage"
  end

  create_table "smallmagicinventories", :force => true do |t|
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "smallmobinfo_id"
    t.integer  "smallmagicinfo_id"
  end

  add_index "smallmagicinventories", ["smallmagicinfo_id"], :name => "index_smallmagicinventories_on_smallmagicinfo_id"
  add_index "smallmagicinventories", ["smallmobinfo_id"], :name => "index_smallmagicinventories_on_smallmobinfo_id"

  create_table "smallmaps", :force => true do |t|
    t.integer  "smalluser_id"
    t.integer  "category_id"
    t.text     "txt"
    t.integer  "start_trial_id"
    t.integer  "end_trial_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "name"
  end

  add_index "smallmaps", ["smalluser_id"], :name => "index_smallmaps_on_smalluser_id"

  create_table "smallmobinfos", :force => true do |t|
    t.string   "name"
    t.integer  "category_id"
    t.integer  "max_hp"
    t.integer  "max_mp"
    t.integer  "high_atk"
    t.integer  "low_atk"
    t.integer  "def"
    t.integer  "agi"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "smallmobs", :force => true do |t|
    t.integer  "smallmobinfo_id"
    t.integer  "smalluser_id"
    t.string   "name"
    t.integer  "hp"
    t.integer  "mp"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "smallmobsquad_id"
  end

  add_index "smallmobs", ["smallmobinfo_id"], :name => "index_smallmobs_on_smallmobinfo_id"
  add_index "smallmobs", ["smallmobsquad_id"], :name => "index_smallmobs_on_smallmobsquad_id"
  add_index "smallmobs", ["smalluser_id"], :name => "index_smallmobs_on_smalluser_id"

  create_table "smallmobsquads", :force => true do |t|
    t.integer  "smalluser_id"
    t.string   "name"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "smallmobunit_id"
  end

  add_index "smallmobsquads", ["smalluser_id"], :name => "index_smallmobsquads_on_smalluser_id"

  create_table "smallmobunits", :force => true do |t|
    t.integer  "smalluser_id"
    t.string   "name"
    t.integer  "smallstrategy_id"
    t.boolean  "is_guard"
    t.integer  "smallmap_id"
    t.boolean  "is_prepared"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "smallmobunits", ["smallmap_id"], :name => "index_smallmobunits_on_smallmap_id"
  add_index "smallmobunits", ["smallstrategy_id"], :name => "index_smallmobunits_on_smallstrategy_id"
  add_index "smallmobunits", ["smalluser_id"], :name => "index_smallmobunits_on_smalluser_id"

  create_table "smallstrategies", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "smalltops", :force => true do |t|
    t.integer  "smalluser_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "smalltops", ["smalluser_id"], :name => "index_smalltops_on_smalluser_id"

  create_table "smalltrialmoblineups", :force => true do |t|
    t.integer  "smalltrial_id"
    t.integer  "squad_id"
    t.string   "squad_name"
    t.integer  "mob_id"
    t.string   "mob_name"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.boolean  "is_guard"
  end

  add_index "smalltrialmoblineups", ["smalltrial_id"], :name => "index_smalltrialmoblineups_on_smalltrial_id"

  create_table "smalltrials", :force => true do |t|
    t.integer  "smallmap_id"
    t.integer  "def_mobunit_id"
    t.integer  "atk_mobunit_id"
    t.integer  "smalltrialstatus_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "def_mobunit_name"
    t.string   "atk_mobunit_name"
  end

  add_index "smalltrials", ["smallmap_id"], :name => "index_smalltrials_on_smallmap_id"
  add_index "smalltrials", ["smalltrialstatus_id"], :name => "index_smalltrials_on_smalltrialstatus_id"

  create_table "smalltrialstatuses", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "smalltrialturns", :force => true do |t|
    t.string   "log"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "smalltrial_id"
  end

  add_index "smalltrialturns", ["smalltrial_id"], :name => "index_smalltrialturns_on_smalltrial_id"

  create_table "smallturnbattlelogs", :force => true do |t|
    t.integer  "smalltrialturn_id"
    t.integer  "src_mob_id"
    t.integer  "tgt_mob_id"
    t.integer  "damage"
    t.integer  "effect_id"
    t.text     "log"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "heal"
  end

  add_index "smallturnbattlelogs", ["smalltrialturn_id"], :name => "index_smallturnbattlelogs_on_smalltrialturn_id"

  create_table "smallturnmobstatuses", :force => true do |t|
    t.integer  "smalltrialturn_id"
    t.integer  "mob_id"
    t.integer  "start_hp"
    t.integer  "end_hp"
    t.integer  "start_mp"
    t.integer  "end_mp"
    t.text     "status"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "smallturnmobstatuses", ["smalltrialturn_id"], :name => "index_smallturnmobstatuses_on_smalltrialturn_id"

  create_table "smallturnsquadtrails", :force => true do |t|
    t.integer  "smalltrialturn_id"
    t.integer  "squad_id"
    t.integer  "from_x"
    t.integer  "from_y"
    t.integer  "to_x"
    t.integer  "to_y"
    t.text     "trail"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.boolean  "is_annihilated"
  end

  add_index "smallturnsquadtrails", ["smalltrialturn_id"], :name => "index_smallturnsquadtrails_on_smalltrialturn_id"

  create_table "smallusers", :force => true do |t|
    t.string   "name"
    t.string   "login_id"
    t.string   "login_pw"
    t.datetime "last_login_at"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "smallweponinfos", :force => true do |t|
    t.string   "name"
    t.integer  "category_id"
    t.integer  "atk"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "smallweponinventories", :force => true do |t|
    t.integer  "smallmob_id"
    t.integer  "smallweponinfo_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "smallweponinventories", ["smallmob_id"], :name => "index_smallweponinventories_on_smallmob_id"
  add_index "smallweponinventories", ["smallweponinfo_id"], :name => "index_smallweponinventories_on_smallweponinfo_id"

  create_table "tinymaps", :force => true do |t|
    t.string   "name"
    t.text     "map"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
