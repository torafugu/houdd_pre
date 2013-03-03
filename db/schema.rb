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

ActiveRecord::Schema.define(:version => 20130303061756) do

  create_table "moresmallarmorinfos", :force => true do |t|
    t.string   "name"
    t.integer  "category_id"
    t.integer  "def"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "moresmallarmorinventories", :force => true do |t|
    t.integer  "moresmallmob_id"
    t.integer  "moresmallarmorinfo_id"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  add_index "moresmallarmorinventories", ["moresmallarmorinfo_id"], :name => "index_moresmallarmorinventories_on_moresmallarmorinfo_id"
  add_index "moresmallarmorinventories", ["moresmallmob_id"], :name => "index_moresmallarmorinventories_on_moresmallmob_id"

  create_table "moresmallbattlelogs", :force => true do |t|
    t.integer  "moresmallbattleturn_id"
    t.integer  "src_mob_id"
    t.integer  "tgt_mob_id"
    t.integer  "damage"
    t.integer  "effect_id"
    t.text     "log"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.integer  "heal"
    t.integer  "src_mob_vpos"
    t.integer  "tgt_mob_vpos"
    t.boolean  "tgt_mob_dead"
  end

  add_index "moresmallbattlelogs", ["moresmallbattleturn_id"], :name => "index_moresmallturnbattlelogs_on_moresmallbattleturn_id"

  create_table "moresmallbattleturns", :force => true do |t|
    t.integer  "moresmalltrialturn_id"
    t.text     "log"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.integer  "src_squad_id"
    t.integer  "tgt_squad_id"
  end

  add_index "moresmallbattleturns", ["moresmalltrialturn_id"], :name => "index_moresmallbattleturns_on_moresmalltrialturn_id"

  create_table "moresmallmagicinfos", :force => true do |t|
    t.string   "name"
    t.integer  "category_id"
    t.integer  "inst_dmg"
    t.integer  "amt_dmg"
    t.integer  "inst_heal"
    t.integer  "amt_heal"
    t.integer  "duration"
    t.integer  "accuracy"
    t.integer  "range"
    t.integer  "mp_cost"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "moresmallmagicinventories", :force => true do |t|
    t.integer  "moresmallmobinfo_id"
    t.integer  "moresmallmagicinfo_id"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  add_index "moresmallmagicinventories", ["moresmallmagicinfo_id"], :name => "index_moresmallmagicinventories_on_moresmallmagicinfo_id"
  add_index "moresmallmagicinventories", ["moresmallmobinfo_id"], :name => "index_moresmallmagicinventories_on_moresmallmobinfo_id"

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

  create_table "moresmallmobeffects", :force => true do |t|
    t.integer  "moresmallmob_id"
    t.integer  "moresmallmagicinfo_id"
    t.integer  "duration"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  add_index "moresmallmobeffects", ["moresmallmagicinfo_id"], :name => "index_moresmallmobeffects_on_moresmallmagicinfo_id"
  add_index "moresmallmobeffects", ["moresmallmob_id"], :name => "index_moresmallmobeffects_on_moresmallmob_id"

  create_table "moresmallmobinfos", :force => true do |t|
    t.string   "name"
    t.integer  "category_id"
    t.integer  "max_hp"
    t.integer  "max_mp"
    t.integer  "str"
    t.integer  "dex"
    t.integer  "int"
    t.integer  "wis"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "moresmallmobs", :force => true do |t|
    t.integer  "moresmallmobinfo_id"
    t.integer  "moresmalluser_id"
    t.string   "name"
    t.integer  "hp"
    t.integer  "mp"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.integer  "moresmallmobsquad_id"
  end

  add_index "moresmallmobs", ["moresmallmobinfo_id"], :name => "index_moresmallmobs_on_moresmallmobinfo_id"
  add_index "moresmallmobs", ["moresmallmobsquad_id"], :name => "index_moresmallmobs_on_moresmallmobsquad_id"
  add_index "moresmallmobs", ["moresmalluser_id"], :name => "index_moresmallmobs_on_moresmalluser_id"

  create_table "moresmallmobsquads", :force => true do |t|
    t.integer  "moresmalluser_id"
    t.integer  "moresmallmobunit_id"
    t.string   "name"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  add_index "moresmallmobsquads", ["moresmallmobunit_id"], :name => "index_moresmallmobsquads_on_moresmallmobunit_id"
  add_index "moresmallmobsquads", ["moresmalluser_id"], :name => "index_moresmallmobsquads_on_moresmalluser_id"

  create_table "moresmallmobunits", :force => true do |t|
    t.integer  "moresmalluser_id"
    t.string   "name"
    t.integer  "moresmallstrategy_id"
    t.integer  "cur_map_id"
    t.integer  "tgt_map_id"
    t.boolean  "is_prepared"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  add_index "moresmallmobunits", ["moresmallstrategy_id"], :name => "index_moresmallmobunits_on_moresmallstrategy_id"
  add_index "moresmallmobunits", ["moresmalluser_id"], :name => "index_moresmallmobunits_on_moresmalluser_id"

  create_table "moresmallstrategies", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "moresmalltops", :force => true do |t|
    t.integer  "moresmalluser_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "moresmalltops", ["moresmalluser_id"], :name => "index_moresmalltops_on_moresmalluser_id"

  create_table "moresmalltrialmobpers", :force => true do |t|
    t.integer  "moresmalltrialsquadpers_id"
    t.integer  "mob_id"
    t.string   "mob_name"
    t.integer  "max_hp"
    t.integer  "max_mp"
    t.integer  "str"
    t.integer  "dex"
    t.integer  "int"
    t.integer  "wis"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.integer  "moresmalltrial_id"
    t.string   "mob_info_name"
  end

  add_index "moresmalltrialmobpers", ["moresmalltrialsquadpers_id"], :name => "index_moresmalltrialmobpers_on_moresmalltrialsquadpers_id"

  create_table "moresmalltrials", :force => true do |t|
    t.integer  "moresmallmap_id"
    t.integer  "def_mobunit_id"
    t.string   "def_mobunit_name"
    t.integer  "atk_mobunit_id"
    t.string   "atk_mobunit_name"
    t.integer  "moresmalltrialstatus_id"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "moresmalltrials", ["moresmallmap_id"], :name => "index_moresmalltrials_on_moresmallmap_id"
  add_index "moresmalltrials", ["moresmalltrialstatus_id"], :name => "index_moresmalltrials_on_moresmalltrialstatus_id"

  create_table "moresmalltrialsquadpers", :force => true do |t|
    t.integer  "moresmalltrial_id"
    t.integer  "mobunit_id"
    t.integer  "squad_id"
    t.string   "squad_name"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "moresmalltrialsquadpers", ["moresmalltrial_id"], :name => "index_moresmalltrialsquadpers_on_moresmalltrial_id"

  create_table "moresmalltrialstatuses", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "moresmalltrialturns", :force => true do |t|
    t.integer  "moresmalltrial_id"
    t.string   "log"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "moresmalltrialturns", ["moresmalltrial_id"], :name => "index_moresmalltrialturns_on_moresmalltrial_id"

  create_table "moresmallturnmobstatuses", :force => true do |t|
    t.integer  "moresmalltrialturn_id"
    t.integer  "mob_id"
    t.integer  "start_hp"
    t.integer  "end_hp"
    t.integer  "start_mp"
    t.integer  "end_mp"
    t.text     "status"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  add_index "moresmallturnmobstatuses", ["moresmalltrialturn_id"], :name => "index_moresmallturnmobstatuses_on_moresmalltrialturn_id"

  create_table "moresmallturnsquadtrails", :force => true do |t|
    t.integer  "moresmalltrialturn_id"
    t.integer  "squad_id"
    t.integer  "from_x"
    t.integer  "from_y"
    t.integer  "to_x"
    t.integer  "to_y"
    t.text     "trail"
    t.boolean  "is_annihilated"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  add_index "moresmallturnsquadtrails", ["moresmalltrialturn_id"], :name => "index_moresmallturnsquadtrails_on_moresmalltrialturn_id"

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

  create_table "moresmallweponinfos", :force => true do |t|
    t.string   "name"
    t.integer  "category_id"
    t.integer  "atk"
    t.integer  "accuracy"
    t.integer  "range"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "moresmallweponinventories", :force => true do |t|
    t.integer  "moresmallmob_id"
    t.integer  "moresmallweponinfo_id"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  add_index "moresmallweponinventories", ["moresmallmob_id"], :name => "index_moresmallweponinventories_on_moresmallmob_id"
  add_index "moresmallweponinventories", ["moresmallweponinfo_id"], :name => "index_moresmallweponinventories_on_moresmallweponinfo_id"

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

  create_table "mostsmallconstlvltbls", :force => true do |t|
    t.integer  "mostsmallconstructioninfo_id"
    t.integer  "level"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  add_index "mostsmallconstlvltbls", ["mostsmallconstructioninfo_id"], :name => "index_mostsmallconstlvltbls_on_mostsmallconstructioninfo_id"

  create_table "mostsmallconstproducts", :force => true do |t|
    t.integer  "mostsmallconstructioninfo_id"
    t.integer  "level"
    t.integer  "mostsmallresource_id"
    t.integer  "amount"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.integer  "remaining_period"
  end

  add_index "mostsmallconstproducts", ["mostsmallconstructioninfo_id"], :name => "index_mostsmallconstproducts_on_mostsmallconstructioninfo_id"
  add_index "mostsmallconstproducts", ["mostsmallresource_id"], :name => "index_mostsmallconstproducts_on_mostsmallresource_id"

  create_table "mostsmallconstructionfamilies", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "mostsmallconstructioninfos", :force => true do |t|
    t.integer  "mostsmallconstructionfamily_id"
    t.string   "name"
    t.integer  "const_period"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  add_index "mostsmallconstructioninfos", ["mostsmallconstructionfamily_id"], :name => "index_constructionfamilies_on_mostsmallconstructioninfo"

  create_table "mostsmallconstructions", :force => true do |t|
    t.integer  "mostsmallterritory_id"
    t.integer  "mostsmallconstructioninfo_id"
    t.integer  "x"
    t.integer  "y"
    t.integer  "level"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.integer  "remaining_period"
  end

  add_index "mostsmallconstructions", ["mostsmallconstructioninfo_id"], :name => "index_mostsmallconstructions_on_mostsmallconstructioninfo_id"
  add_index "mostsmallconstructions", ["mostsmallterritory_id"], :name => "index_mostsmallconstructions_on_mostsmallterritory_id"

  create_table "mostsmalldayturns", :force => true do |t|
    t.integer  "turn"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "mostsmalleffects", :force => true do |t|
    t.string   "name"
    t.integer  "damage"
    t.integer  "ac"
    t.integer  "sp_mod"
    t.integer  "str_mod"
    t.integer  "dex_mod"
    t.integer  "con_mod"
    t.integer  "int_mod"
    t.integer  "wis_mod"
    t.integer  "cha_mod"
    t.integer  "duration"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "mostsmallelements", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "mostsmallequipslotinventories", :force => true do |t|
    t.integer  "mostsmallequipslot_id"
    t.integer  "mostsmallmobspecie_id"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  add_index "mostsmallequipslotinventories", ["mostsmallequipslot_id"], :name => "index_mostsmallequipslotinventories_on_mostsmallequipslot_id"
  add_index "mostsmallequipslotinventories", ["mostsmallmobspecie_id"], :name => "index_mostsmallequipslotinventories_on_mostsmallmobspecie_id"

  create_table "mostsmallequipslots", :force => true do |t|
    t.string   "name"
    t.boolean  "is_hand"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "mostsmallitemcategories", :force => true do |t|
    t.integer  "mostsmallequipslot_id"
    t.string   "name"
    t.integer  "wepon_level"
    t.integer  "armor_level"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.boolean  "is_two_hand"
  end

  add_index "mostsmallitemcategories", ["mostsmallequipslot_id"], :name => "index_mostsmallitemcategories_on_mostsmallequipslot_id"

  create_table "mostsmallitemeffectinventories", :force => true do |t|
    t.integer  "mostsmalliteminfo_id"
    t.integer  "mostsmalleffect_id"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  add_index "mostsmallitemeffectinventories", ["mostsmalleffect_id"], :name => "index_mostsmallitemeffectinventories_on_mostsmalleffect_id"
  add_index "mostsmallitemeffectinventories", ["mostsmalliteminfo_id"], :name => "index_mostsmallitemeffectinventories_on_mostsmalliteminfo_id"

  create_table "mostsmallitemequipinventories", :force => true do |t|
    t.integer  "mostsmallitem_id"
    t.integer  "mostsmallmob_id"
    t.integer  "mostsmallequipslot_id"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  add_index "mostsmallitemequipinventories", ["mostsmallequipslot_id"], :name => "index_mostsmallitemequipinventories_on_mostsmallequipslot_id"
  add_index "mostsmallitemequipinventories", ["mostsmallitem_id"], :name => "index_mostsmallitemequipinventories_on_mostsmallitem_id"
  add_index "mostsmallitemequipinventories", ["mostsmallmob_id"], :name => "index_mostsmallitemequipinventories_on_mostsmallmob_id"

  create_table "mostsmalliteminfos", :force => true do |t|
    t.integer  "mostsmallitemcategory_id"
    t.integer  "mostsmallelement_id"
    t.integer  "mostsmallmobspecie_id"
    t.string   "name"
    t.integer  "num_of_tgt"
    t.integer  "accuracy"
    t.integer  "range"
    t.integer  "damage"
    t.integer  "ac"
    t.integer  "max_dp"
    t.integer  "const_period"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  add_index "mostsmalliteminfos", ["mostsmallelement_id"], :name => "index_mostsmalliteminfos_on_mostsmallelement_id"
  add_index "mostsmalliteminfos", ["mostsmallitemcategory_id"], :name => "index_mostsmalliteminfos_on_mostsmallitemcategory_id"
  add_index "mostsmalliteminfos", ["mostsmallmobspecie_id"], :name => "index_mostsmalliteminfos_on_mostsmallmobspecie_id"

  create_table "mostsmallitems", :force => true do |t|
    t.integer  "mostsmalliteminfo_id"
    t.integer  "mostsmalluser_id"
    t.integer  "dp"
    t.integer  "quality"
    t.integer  "remaining_period"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  add_index "mostsmallitems", ["mostsmalliteminfo_id"], :name => "index_mostsmallitems_on_mostsmalliteminfo_id"
  add_index "mostsmallitems", ["mostsmalluser_id"], :name => "index_mostsmallitems_on_mostsmalluser_id"

  create_table "mostsmalljobs", :force => true do |t|
    t.string   "name"
    t.float    "growth_mod"
    t.integer  "wepon_lvl"
    t.integer  "armor_lvl"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "mostsmallmobgenes", :force => true do |t|
    t.integer  "mostsmallmobspecie_id"
    t.integer  "mothermobgene_id"
    t.integer  "fathermobgene_id"
    t.string   "name"
    t.float    "phys_mod"
    t.float    "int_mod"
    t.float    "prolificacy_mod"
    t.float    "longevity_mod"
    t.float    "cost_mod"
    t.float    "growth_mod"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  add_index "mostsmallmobgenes", ["mostsmallmobspecie_id"], :name => "index_mostsmallmobgenes_on_mostsmallmobspecie_id"

  create_table "mostsmallmoblvltbls", :force => true do |t|
    t.integer  "mostsmallmobspecie_id"
    t.integer  "level"
    t.integer  "exp"
    t.integer  "max_hp"
    t.integer  "max_sp"
    t.integer  "str"
    t.integer  "dex"
    t.integer  "con"
    t.integer  "int"
    t.integer  "wis"
    t.integer  "cha"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  add_index "mostsmallmoblvltbls", ["mostsmallmobspecie_id"], :name => "index_mostsmallmoblvltbls_on_mostsmallmobspecie_id"

  create_table "mostsmallmobs", :force => true do |t|
    t.integer  "mostsmallmobgene_id"
    t.integer  "level"
    t.integer  "mostsmalljob_id"
    t.integer  "job_level"
    t.integer  "mostsmalluser_id"
    t.integer  "mostsmallsquad_id"
    t.string   "name"
    t.boolean  "gender"
    t.integer  "age"
    t.integer  "max_hp"
    t.integer  "max_sp"
    t.integer  "hp"
    t.integer  "sp"
    t.integer  "str"
    t.integer  "dex"
    t.integer  "con"
    t.integer  "int"
    t.integer  "wis"
    t.integer  "cha"
    t.float    "battle_exp"
    t.float    "job_exp"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  add_index "mostsmallmobs", ["mostsmalljob_id"], :name => "index_mostsmallmobs_on_mostsmalljob_id"
  add_index "mostsmallmobs", ["mostsmallmobgene_id"], :name => "index_mostsmallmobs_on_mostsmallmobgene_id"
  add_index "mostsmallmobs", ["mostsmallsquad_id"], :name => "index_mostsmallmobs_on_mostsmallsquad_id"
  add_index "mostsmallmobs", ["mostsmalluser_id"], :name => "index_mostsmallmobs_on_mostsmalluser_id"

  create_table "mostsmallmobspecies", :force => true do |t|
    t.string   "name"
    t.integer  "prolificacy"
    t.integer  "longevity"
    t.float    "cost"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "damage"
    t.integer  "ac"
  end

  create_table "mostsmallresearches", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "mostsmallresearchlvls", :force => true do |t|
    t.integer  "mostsmalluser_id"
    t.integer  "mostsmallresearch_id"
    t.integer  "level"
    t.integer  "rp"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  add_index "mostsmallresearchlvls", ["mostsmallresearch_id"], :name => "index_mostsmallresearchlvls_on_mostsmallresearch_id"
  add_index "mostsmallresearchlvls", ["mostsmalluser_id"], :name => "index_mostsmallresearchlvls_on_mostsmalluser_id"

  create_table "mostsmallresearchlvltbls", :force => true do |t|
    t.integer  "mostsmallresearch_id"
    t.integer  "level"
    t.integer  "rp"
    t.integer  "keep_rp"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  add_index "mostsmallresearchlvltbls", ["mostsmallresearch_id"], :name => "index_mostsmallresearchlvltbls_on_mostsmallresearch_id"

  create_table "mostsmallresources", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "mostsmallresstocks", :force => true do |t|
    t.integer  "mostsmalluser_id"
    t.integer  "mostsmallresource_id"
    t.integer  "amount"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  add_index "mostsmallresstocks", ["mostsmallresource_id"], :name => "index_mostsmallresstocks_on_mostsmallresource_id"
  add_index "mostsmallresstocks", ["mostsmalluser_id"], :name => "index_mostsmallresstocks_on_mostsmalluser_id"

  create_table "mostsmallroads", :force => true do |t|
    t.integer  "start_territory_id"
    t.integer  "dest_territory_id"
    t.integer  "distance"
    t.integer  "level"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.integer  "remaining_period"
  end

  create_table "mostsmallskillcategories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "mostsmallskilleffectinventories", :force => true do |t|
    t.integer  "mostsmallskilllvltbl_id"
    t.integer  "mostsmalleffect_id"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "mostsmallskilleffectinventories", ["mostsmalleffect_id"], :name => "index_mostsmallskilleffectinventories_on_mostsmalleffect_id"
  add_index "mostsmallskilleffectinventories", ["mostsmallskilllvltbl_id"], :name => "index_mostsmallskilleffectinventories_on_mostsmallskilllvltbl_id"

  create_table "mostsmallskilllvltbls", :force => true do |t|
    t.integer  "mostsmallskill_id"
    t.integer  "level"
    t.integer  "sp_cost"
    t.integer  "num_of_tgt"
    t.integer  "accuracy"
    t.integer  "range"
    t.integer  "damage"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "mostsmallskilllvltbls", ["mostsmallskill_id"], :name => "index_mostsmallskilllvltbls_on_mostsmallskill_id"

  create_table "mostsmallskills", :force => true do |t|
    t.integer  "mostsmallskillcategory_id"
    t.integer  "mostsmalljob_id"
    t.integer  "job_level"
    t.integer  "mostsmallelement_id"
    t.string   "name"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "mostsmallskills", ["mostsmallelement_id"], :name => "index_mostsmallskills_on_mostsmallelement_id"
  add_index "mostsmallskills", ["mostsmalljob_id"], :name => "index_mostsmallskills_on_mostsmalljob_id"
  add_index "mostsmallskills", ["mostsmallskillcategory_id"], :name => "index_mostsmallskills_on_mostsmallskillcategory_id"

  create_table "mostsmallspeciejobinventories", :force => true do |t|
    t.integer  "mostsmallmobspecie_id"
    t.integer  "mostsmalljob_id"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  add_index "mostsmallspeciejobinventories", ["mostsmalljob_id"], :name => "index_mostsmallspeciejobinventories_on_mostsmalljob_id"
  add_index "mostsmallspeciejobinventories", ["mostsmallmobspecie_id"], :name => "index_mostsmallspeciejobinventories_on_mostsmallmobspecie_id"

  create_table "mostsmallsquads", :force => true do |t|
    t.integer  "mostsmalluser_id"
    t.integer  "mostsmallterritory_id"
    t.string   "name"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  add_index "mostsmallsquads", ["mostsmallterritory_id"], :name => "index_mostsmallsquads_on_mostsmallterritory_id"
  add_index "mostsmallsquads", ["mostsmalluser_id"], :name => "index_mostsmallsquads_on_mostsmalluser_id"

  create_table "mostsmallterrainproducts", :force => true do |t|
    t.integer  "mostsmallterrain_id"
    t.integer  "mostsmallresource_id"
    t.integer  "amount"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  add_index "mostsmallterrainproducts", ["mostsmallresource_id"], :name => "index_mostsmallterrainproducts_on_mostsmallresource_id"
  add_index "mostsmallterrainproducts", ["mostsmallterrain_id"], :name => "index_mostsmallterrainproducts_on_mostsmallterrain_id"

  create_table "mostsmallterrains", :force => true do |t|
    t.string   "symbol"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "mostsmallterritories", :force => true do |t|
    t.integer  "mostsmalluser_id"
    t.string   "name"
    t.text     "map_txt"
    t.text     "dungeon_txt"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.boolean  "is_exclusive"
  end

  add_index "mostsmallterritories", ["mostsmalluser_id"], :name => "index_mostsmallterritories_on_mostsmalluser_id"

  create_table "mostsmalltrapeffectinventories", :force => true do |t|
    t.integer  "mostsmalltraplvltbl_id"
    t.integer  "mostsmalleffect_id"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
  end

  add_index "mostsmalltrapeffectinventories", ["mostsmalleffect_id"], :name => "index_mostsmalltrapeffectinventories_on_mostsmalleffect_id"
  add_index "mostsmalltrapeffectinventories", ["mostsmalltraplvltbl_id"], :name => "index_mostsmalltrapeffectinventories_on_mostsmalltraplvltbl_id"

  create_table "mostsmalltrapeffects", :force => true do |t|
    t.integer  "mostsmalltrapleveltable_id"
    t.integer  "mostsmalleffect_id"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  add_index "mostsmalltrapeffects", ["mostsmalleffect_id"], :name => "index_mostsmalltrapeffects_on_mostsmalleffect_id"
  add_index "mostsmalltrapeffects", ["mostsmalltrapleveltable_id"], :name => "index_mostsmalltrapeffects_on_mostsmalltrapleveltable_id"

  create_table "mostsmalltrapinfos", :force => true do |t|
    t.string   "name"
    t.integer  "const_period"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.integer  "mostsmallelement_id"
  end

  add_index "mostsmalltrapinfos", ["mostsmallelement_id"], :name => "index_mostsmalltrapinfos_on_mostsmallelement_id"

  create_table "mostsmalltraplvltbls", :force => true do |t|
    t.integer  "mostsmalltrapinfo_id"
    t.integer  "level"
    t.integer  "max_dp"
    t.integer  "disarm_diff"
    t.integer  "num_of_tgt"
    t.integer  "damage"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  add_index "mostsmalltraplvltbls", ["mostsmalltrapinfo_id"], :name => "index_mostsmalltraplvltbls_on_mostsmalltrapinfo_id"

  create_table "mostsmalltraps", :force => true do |t|
    t.integer  "mostsmalltrapinfo_id"
    t.integer  "mostsmallterritory_id"
    t.integer  "dungeon_x"
    t.integer  "dungeon_y"
    t.integer  "level"
    t.integer  "dp"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.integer  "remaining_period"
  end

  add_index "mostsmalltraps", ["mostsmallterritory_id"], :name => "index_mostsmalltraps_on_mostsmallterritory_id"
  add_index "mostsmalltraps", ["mostsmalltrapinfo_id"], :name => "index_mostsmalltraps_on_mostsmalltrapinfo_id"

  create_table "mostsmallusers", :force => true do |t|
    t.string   "name"
    t.boolean  "is_admin"
    t.string   "login_id"
    t.string   "login_pw"
    t.datetime "first_login_at"
    t.datetime "last_login_at"
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
