class MediumHouddUsersController < ApplicationController
  # GET /medium_houdd_users
  # GET /medium_houdd_users.json
  def index
    @medium_houdd_users = MediumHouddUser.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @medium_houdd_users }
    end
  end

  # GET /medium_houdd_users/1
  # GET /medium_houdd_users/1.json
  def show
    @medium_houdd_user = MediumHouddUser.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @medium_houdd_user }
    end
  end

  # GET /medium_houdd_users/new
  # GET /medium_houdd_users/new.json
  def new
    @medium_houdd_user = MediumHouddUser.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @medium_houdd_user }
    end
  end

  # GET /medium_houdd_users/1/edit
  def edit
    @medium_houdd_user = MediumHouddUser.find(params[:id])
  end

  # POST /medium_houdd_users
  # POST /medium_houdd_users.json
  def create
    @medium_houdd_user = MediumHouddUser.new(params[:medium_houdd_user])

    respond_to do |format|
      if @medium_houdd_user.save
        format.html { redirect_to @medium_houdd_user, notice: 'Medium houdd user was successfully created.' }
        format.json { render json: @medium_houdd_user, status: :created, location: @medium_houdd_user }
      else
        format.html { render action: "new" }
        format.json { render json: @medium_houdd_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /medium_houdd_users/1
  # PUT /medium_houdd_users/1.json
  def update
    @medium_houdd_user = MediumHouddUser.find(params[:id])

    respond_to do |format|
      if @medium_houdd_user.update_attributes(params[:medium_houdd_user])
        format.html { redirect_to @medium_houdd_user, notice: 'Medium houdd user was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @medium_houdd_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /medium_houdd_users/1
  # DELETE /medium_houdd_users/1.json
  def destroy
    @medium_houdd_user = MediumHouddUser.find(params[:id])
    @medium_houdd_user.destroy

    respond_to do |format|
      format.html { redirect_to medium_houdd_users_url }
      format.json { head :no_content }
    end
  end

  # GET /medium_houdd_users/1/admin_top
  def admin_top
    @medium_houdd_user = MediumHouddUser.find(params[:id])
    render
  end

  # GET /medium_houdd_users/1/admin_master
  def admin_master
    @medium_houdd_user = MediumHouddUser.find(params[:id])
    render
  end

  # GET /medium_houdd_users/1/admin_mob
  def admin_mob
    @medium_houdd_user = MediumHouddUser.find(params[:id])
    render
  end

  # GET /medium_houdd_users/1/mypage_top
  def mypage_top
    @medium_houdd_user = MediumHouddUser.find(params[:id])
    @research_wepon = @medium_houdd_user.medium_research_allotments.find_by_research_sym("WEPON")
    @research_armor = @medium_houdd_user.medium_research_allotments.find_by_research_sym("ARMOR")
    @research_potion = @medium_houdd_user.medium_research_allotments.find_by_research_sym("POTION")
    @research_trap = @medium_houdd_user.medium_research_allotments.find_by_research_sym("TRAP")
    render
  end

  # GET /medium_houdd_users/1/mypage_territory
  def mypage_territory
    @medium_houdd_user = MediumHouddUser.find(params[:id])
    render
  end

  # GET /medium_houdd_users/1/mypage_dungeon
  def mypage_dungeon
    @medium_houdd_user = MediumHouddUser.find(params[:id])
    render
  end

  # GET /medium_houdd_users/1/mypage_research
  def mypage_research
    @medium_houdd_user = MediumHouddUser.find(params[:id])
    @research_wepon = @medium_houdd_user.medium_research_allotments.find_by_research_sym("WEPON")
    @research_armor = @medium_houdd_user.medium_research_allotments.find_by_research_sym("ARMOR")
    @research_potion = @medium_houdd_user.medium_research_allotments.find_by_research_sym("POTION")
    @research_trap = @medium_houdd_user.medium_research_allotments.find_by_research_sym("TRAP")
    render
  end

  # GET /medium_houdd_users/1/mypage_manufacture
  def mypage_manufacture
    @medium_houdd_user = MediumHouddUser.find(params[:id])
    render
  end

  # GET /medium_houdd_users/1/mypage_item
  def mypage_item
    @medium_houdd_user = MediumHouddUser.find(params[:id])
    render
  end

  # GET /medium_houdd_users/1/mypage_mob
  def mypage_mob
    @medium_houdd_user = MediumHouddUser.find(params[:id])
    specie_ids = MediumMob.find_all_by_medium_houdd_user_id(@medium_houdd_user.id).collect{|m| [m.medium_specie_id]}.uniq
    @medium_species = MediumSpecie.find_all_by_id(specie_ids)
    render
  end

  # GET /medium_houdd_users/1/mypage_mission
  def mypage_mission
    @medium_houdd_user = MediumHouddUser.find(params[:id])
    render
  end

  # GET /medium_houdd_users/1/mypage_mission/1/mission_log
  def mypage_mission_log
    @medium_houdd_user = MediumHouddUser.find(params[:id])
    @medium_mision = MediumMission.find(params[:mission_id])
    @start_trial_turn_index = 0
    unless @medium_mision.trial.occured_at.nil?
      @start_trial_turn_index = 1
      @last_trial_turn_index = @medium_mision.trial.medium_trial_turns.length
    else
      @last_trial_turn_index = 0
    end
    render
  end

  # GET /medium_houdd_users/1/mypage_mission/1/draw_dungeon_cell
  def draw_dungeon_cell
    @medium_mision = MediumMission.find(params[:mission_id])
    render
  end

  # GET /medium_houdd_users/1/mypage_mission/1/1/view_trial_log
  def view_trial_log
    medium_mision = MediumMission.find(params[:mission_id])
    unless medium_mision.trial.occured_at.nil?
      trial_turn_index = params[:trial_turn_index].to_i - 1
      trial_turn_index = 0 if trial_turn_index < 0
      @current_trial_turn = MediumTrialTurn.find_all_by_medium_trial_id(medium_mision.trial.id)[trial_turn_index]
      @start_battle_turn_index = 0
      @last_battle_turn_index = 0
      unless @current_trial_turn.medium_battle_turns.blank?
        @current_battle_turn = @current_trial_turn.medium_battle_turns.first
        @start_battle_turn_index = 1
        @last_battle_turn_index = @current_trial_turn.medium_battle_turns.length
      end
      render
    end
  end

  # GET /medium_houdd_users/1/mypage_mission/1/1/1/view_battle_log
  def view_battle_log
    medium_mision = MediumMission.find(params[:mission_id])
    trial_turn_index = params[:trial_turn_index].to_i - 1
    trial_turn_index = 0 if trial_turn_index < 0
    current_trial_turn = MediumTrialTurn.find_all_by_medium_trial_id(medium_mision.trial.id)[trial_turn_index]
    battle_turn_index = params[:battle_turn_index].to_i - 1
    battle_turn_index = 0 if battle_turn_index < 0
    @current_battle_turn = current_trial_turn.medium_battle_turns[battle_turn_index]
    @is_start_battle_turn_index = false
    @is_start_battle_turn_index = true if battle_turn_index == 0
    render
  end

  # GET /medium_houdd_users/1/mypage_strategy
  def mypage_strategy
    @medium_houdd_user = MediumHouddUser.find(params[:id])
    render
  end

  # GET /medium_houdd_users/1/select_items
  def select_items
    @items = MediumItem.all(:include => :medium_item_info, :conditions => ["medium_houdd_user_id = ? AND medium_item_infos.item_category_sym = ?", params[:id], params[:iteminfosym_id]])
    render
  end

  # GET /medium_houdd_users/1/select_mobs
  def select_mobs
    @mobs = MediumMob.find_all_by_medium_houdd_user_id_and_medium_job_id(params[:id], params[:job_id])
    render
  end

  # GET /medium_houdd_users/1/select_mob_status
  def select_mob_status
    @mob= MediumMob.find(params[:mob_id])
    render
  end

  # GET /medium_houdd_users/1/select_mob_skills
  def select_mob_skills
    @mob= MediumMob.find(params[:mob_id])
    render
  end

  # GET /medium_houdd_users/1/select_mob_equips
  def select_mob_equips
    @mob= MediumMob.find(params[:mob_id])
    render
  end

  # GET /medium_houdd_users/1/select_iteminfo_id
  def select_iteminfo_id
    @iteminfo = MediumItemInfo.find(params[:iteminfo_id])
    render
  end

  # GET /medium_houdd_users/1/select_map_id
  def select_map_id
    @medium_map = MediumMap.find(params[:map_id]) unless params[:map_id].blank?
    render
  end

  # GET /medium_houdd_users/1/select_map_id2
  def select_map_id2
    @dungeons = MediumMap.find(params[:map_id2]).all_dungeons.collect{|m| [m.name, m.id]}.insert(0, "") unless params[:map_id2].blank?
    render
  end

  # GET /medium_houdd_users/1/select_dungeon_id
  def select_dungeon_id
    @medium_dungeon = MediumDungeon.find(params[:dungeon_id]) unless params[:dungeon_id].blank?
    medium_missions = MediumMission.find_all_by_category_sym_and_medium_map_id_and_completed_flg("DEFENCE", @medium_dungeon.medium_map_cell.medium_map_id, false) unless @medium_dungeon.blank?
    @mission_squads = medium_missions.first.medium_squads.collect{|m| [m.name, m.id]}.insert(0, "") unless medium_missions.blank?
    traps = MediumItem.all(:include => :medium_item_info, :conditions => ["medium_houdd_user_id = ? AND medium_item_infos.item_category_sym = ?", params[:id], Consts::ITEM_TRAP_SYMBOL])
    @trap_stocks = (traps - @medium_dungeon.all_traps).collect{|m| [m.info_name, m.id]}.insert(0, "") unless traps.blank?
    render
  end

  # GET /medium_houdd_users/1/select_mapcell_id
  def select_mapcell_id
    @medium_map_cell = MediumMapCell.find_by_medium_map_id_and_x_and_y(params[:map_id], params[:x], params[:y])
    unless @medium_map_cell.blank?
      @selectable_construction = MediumConstruction.find_all_by_medium_terrain_id(@medium_map_cell.medium_terrain.id).collect{|m| [m.name, m.id]}
      @under_construction = MediumConstructionQue.find_by_medium_map_cell_id(@medium_map_cell.id)
    end
    render
  end

  # GET /medium_houdd_users/:id/select_dungeon/:dungeon_id/:x/:y
  def select_dungeoncell_id
    @medium_dungeon_cell = MediumDungeonCell.find_by_medium_dungeon_id_and_x_and_y(params[:dungeon_id], params[:x], params[:y])
    
    respond_to do |format|
      format.js
    end
  end

  # GET /medium_houdd_users/1/select_mob_mates
  def select_mob_mates
    @fathers = MediumMob.find_all_by_medium_houdd_user_id_and_gender_sym_and_medium_specie_id(params[:id], 'M', params[:specie_id]).collect{|m| [m.name, m.id]}
    @mothers = MediumMob.find_all_by_medium_houdd_user_id_and_gender_sym_and_medium_specie_id(params[:id], 'F', params[:specie_id]).collect{|m| [m.name, m.id]}
    render
  end

  # GET /medium_houdd_users/1/update_allotments
  def update_allotments
    @medium_houdd_user = MediumHouddUser.find(params[:id])
    
    respond_to do |format|
      if @medium_houdd_user.update_attributes(params[:medium_houdd_user])
        format.html { redirect_to action: "mypage_top", notice: 'Medium houdd user was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "mypage_top" }
        format.json { render json: @medium_houdd_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /medium_houdd_users/1/update_construction
  def update_construction
    mapcell_construction = MediumConstructionQue.find_by_medium_map_cell_id(params[:mapcell_id])
    mapcell_construction.destroy unless mapcell_construction.blank?
    medium_construction = MediumConstruction.find(params[:mapcell_construction_id])
    @medium_construction_que = MediumConstructionQue.new
    @medium_construction_que.medium_houdd_user_id = params[:id]
    @medium_construction_que.medium_construction_id = medium_construction.id
    @medium_construction_que.medium_map_cell_id = params[:mapcell_id]
    @medium_construction_que.nec_point = medium_construction.prod_point

    @medium_construction_que.save
    render
  end

  # GET /medium_houdd_users/1/update_research
  def update_research
    medium_houdd_user = MediumHouddUser.find(params[:id])
    research_wepon = medium_houdd_user.medium_research_allotments.find_by_research_sym("WEPON")
    research_wepon.allotment = params[:wepon_percent]
    research_wepon.save
    research_armor = medium_houdd_user.medium_research_allotments.find_by_research_sym("ARMOR")
    research_armor.allotment = params[:armor_percent]
    research_armor.save
    research_potion = medium_houdd_user.medium_research_allotments.find_by_research_sym("POTION")
    research_potion.allotment = params[:potion_percent]
    research_potion.save
    research_trap = medium_houdd_user.medium_research_allotments.find_by_research_sym("TRAP")
    research_trap.allotment = params[:trap_percent]
    research_trap.save
    render
  end

  # GET /medium_houdd_users/1/update_mob_equips
  def update_mob_equips
    @medium_houdd_user = MediumHouddUser.find(params[:id])

    item_equip_env_save_success_flg = true
    params.each do |key, value|
      if key.index('mypage')
        value.each do |key2, value2|
          item_equip_inv = MediumItemEquipInv.find(key2)
          item_equip_inv.medium_item_id = value2
          item_equip_inv_save_success_flg = item_equip_inv.save
          break unless item_equip_env_save_success_flg
        end
      end
    end

    respond_to do |format|
      if item_equip_env_save_success_flg
        format.json { head :no_content }
      else
        format.json { head :no_content, status: :unprocessable_entity }
      end
    end  
  end

  # GET /medium_houdd_users/1/all_mobs_auto_equip
  def all_mobs_auto_equip
    mobs = MediumMob.find_all_by_medium_houdd_user_id(params[:id])
    mobs.each do |mob|
      mob.auto_equip
    end

    all_mobs_auto_equip_success_flg = true
    respond_to do |format|
      if all_mobs_auto_equip_success_flg
        format.json { head :no_content }
      else
        format.json { head :no_content, status: :unprocessable_entity }
      end
    end  
  end

  # GET /medium_houdd_users/1/add_item_que
  def add_item_que
    @medium_houdd_user = MediumHouddUser.find(params[:id])
    item_info = MediumItemInfo.find(params[:iteminfo_id])
    params[:item_num].to_i.times do
      item_que = MediumItemManufactureQue.new
      item_que.medium_houdd_user_id = params[:id]
      item_que.medium_item_info_id = item_info.id
      item_que.nec_point = item_info.prod_point
      item_que.save
    end
    render
  end

  # GET /medium_houdd_users/1/add_random_gene
  def add_random_gene
    MediumGeneCreator.execute(params[:specie_id], params[:gene_num].to_i)
    render
  end

  # GET /medium_houdd_users/1/add_random_mob
  def add_random_mob
    MediumMobCreator.random_execute(params[:mobspecie_id], params[:mob_num].to_i, params[:mobuser_id])
    render
  end

  # POST /medium_houdd_users/1/create_random_user_mob
  def create_random_user_mob
    MediumMobCreator.random_execute(params[:mypage]['specie_id'], 1, params[:id])

    update_create_random_user_flg = true
    respond_to do |format|
      if update_create_random_user_flg
        format.json { head :no_content }
      else
        format.json { head :no_content, status: :unprocessable_entity }
      end
    end  
  end

  # POST /medium_houdd_users/1/create_mated_user_mob
  def create_mated_user_mob
    MediumMobCreator.mating_execute(params[:mypage_father_id], params[:mypage_mother_id], params[:id])

    update_create_mated_user_flg = true
    respond_to do |format|
      if update_create_mated_user_flg
        format.json { head :no_content }
      else
        format.json { head :no_content, status: :unprocessable_entity }
      end
    end  
  end

  # GET /medium_houdd_users/1/delete_item_que
  def delete_item_que
    @medium_houdd_user = MediumHouddUser.find(params[:id])
    @medium_item_manufacture_que = MediumItemManufactureQue.find(params[:delete_id])
    @medium_item_manufacture_que.destroy
    render
  end

  # GET /medium_houdd_users/1/add_squad
  def add_squad
    @squad_id = nil
    @squad_name = nil
    @squad_map_id = nil
    mobs = MediumMob.find_all_by_medium_squad_id(nil)
    @free_mobs = mobs.collect{|l| [l.name_with_job, l.id]} unless mobs.blank?
    @assigned_mobs = []
    render
  end

  # GET /medium_houdd_users/1/edit_squad
  def edit_squad
    squad = MediumSquad.find(params[:squad_id])
    @squad_id = squad.id
    @squad_name = squad.name
    @squad_map_id = squad.medium_map_id
    mobs = MediumMob.find_all_by_medium_squad_id_and_medium_houdd_user_id(nil, params[:id])
    @free_mobs = mobs.collect{|l| [l.name_with_job, l.id]} unless mobs.blank?
    @assigned_mobs = squad.medium_mobs.collect{|l| [l.name_with_job, l.id]} unless mobs.blank?
    render
  end

  # POST /medium_houdd_users/1/update_squad
  def update_squad
    squad = MediumSquad.find(params[:mypage]['squad_id']) unless params[:mypage]['squad_id'].blank?
    squad = MediumSquad.new if squad.blank?
    squad.medium_houdd_user_id = params[:id]
    squad.name = params[:mypage]['name']
    squad.medium_map_id = params[:mypage]['map_id']
    squad.save

    free_mobs = params[:mypage]['free_mobs']
    free_mobs.each do |mob_id|
      unless mob_id.blank?
        mob = MediumMob.find(mob_id)
        mob.medium_squad_id = nil
        mob.save
      end
    end

    assigned_mobs = params[:mypage]['assigned_mobs']
    assigned_mobs.each do |mob_id|
      unless mob_id.blank?
        mob = MediumMob.find(mob_id)
        mob.medium_squad_id = squad.id
        mob.save
      end
    end

    update_squad_save_success_flg = true
    respond_to do |format|
      if update_squad_save_success_flg
        format.json { head :no_content }
      else
        format.json { head :no_content, status: :unprocessable_entity }
      end
    end  
  end

  # PUT /medium_houdd_users/:id/update_dungeon_squad/:dungeon_id/:x/:y
  def update_dungeon_squad
    to_delete_squad_dungeon_cell = MediumDungeonCell.find_by_medium_squad_id(params[:dungeoncell]['squad_id'])
    unless to_delete_squad_dungeon_cell.blank?
      to_delete_squad_dungeon_cell.medium_squad_id = nil
      to_delete_squad_dungeon_cell.save
    end

    dungeon_cell = MediumDungeonCell.find_by_medium_dungeon_id_and_x_and_y(params[:dungeon_id], params[:x], params[:y])
    dungeon_cell.medium_squad_id = params[:dungeoncell]['squad_id']
    dungeon_cell.save

    update_dungeon_squad_save_success_flg = true
    respond_to do |format|
      if update_dungeon_squad_save_success_flg
        format.json { head :no_content }
      else
        format.json { head :no_content, status: :unprocessable_entity }
      end
    end  
  end

  # PUT /medium_houdd_users/:id/update_dungeon_trap/:dungeon_id/:x/:y
  def update_dungeon_trap

    to_delete_trap_dungeon_cell = MediumDungeonCell.find_by_trap_id(params[:dungeoncell]['trap_id'])
    unless to_delete_trap_dungeon_cell.blank?
      to_delete_trap_dungeon_cell.trap_id = nil
      to_delete_trap_dungeon_cell.save
    end

    dungeon_cell = MediumDungeonCell.find_by_medium_dungeon_id_and_x_and_y(params[:dungeon_id], params[:x], params[:y])
    dungeon_cell.trap_id = params[:dungeoncell]['trap_id']
    dungeon_cell.save

    update_dungeon_trap_save_success_flg = true
    respond_to do |format|
      if update_dungeon_trap_save_success_flg
        format.json { head :no_content }
      else
        format.json { head :no_content, status: :unprocessable_entity }
      end
    end  
  end

  # DELETE /medium_houdd_users/1/delete_squad/1
  def delete_squad
    @medium_squad = MediumSquad.find(params[:squad_id])
    @medium_squad.destroy

    delete_squad_save_success_flg = true
    respond_to do |format|
      if delete_squad_save_success_flg
        format.json { head :no_content }
      else
        format.json { head :no_content, status: :unprocessable_entity }
      end
    end  
  end

  # GET /medium_houdd_users/1/add_mission
  def add_mission
    @mission_id = nil
    @mission_map_id = nil
    @mission_category_sym = nil
    @mission_strategy_id = nil
    @mission_priority = nil
    @all_squads = MediumSquad.find_all_by_medium_houdd_user_id(params[:id]).collect{|l| [l.name, l.id]}
    @assigned_squads = []
    render
  end

  # GET /medium_houdd_users/1/edit_mission
  def edit_mission
    mission = MediumMission.find(params[:mission_id])
    @mission_id = mission.id
    @mission_map_id = mission.medium_map_id
    @mission_category_sym = mission.category_sym
    @mission_strategy_id = mission.medium_mission_strategy_id
    @mission_priority = mission.priority
    @assigned_squads = mission.medium_squads.collect{|l| [l.name, l.id]} unless mission.medium_squads.blank?
    @all_squads = MediumSquad.find_all_by_medium_houdd_user_id(params[:id]).collect{|l| [l.name, l.id]} - @assigned_squads
    
    render
  end

  # POST /medium_houdd_users/1/update_mission
  def update_mission
    mission = MediumMission.find(params[:mypage]['mission_id']) unless params[:mypage]['mission_id'].blank?
    mission = MediumMission.new if mission.blank?
    mission.medium_houdd_user_id = params[:id]
    mission.priority = params[:mypage]['priority'].to_i
    mission.category_sym = params[:mypage]['category_sym']
    mission.medium_map_id = params[:mypage]['map_id']
    mission.medium_mission_strategy_id = params[:mypage]['strategy_id']
    mission.save

    assigned_squads = params[:mypage]['assigned_squads']
    assigned_squads.each do |squad_id|
      unless squad_id.blank?
        mission_inv = MediumMissionInv.find_by_medium_squad_id_and_medium_mission_id(squad_id, mission.id)
        mission_inv = MediumMissionInv.new if mission_inv.blank?
        mission_inv.medium_squad_id = squad_id
        mission_inv.medium_mission_id = mission.id
        mission_inv.save
      end
    end

    not_assigned_squads = params[:mypage]['all_squads']
    not_assigned_squads.each do |squad_id|
      unless squad_id.blank?

        mission_inv = MediumMissionInv.find_by_medium_squad_id_and_medium_mission_id(squad_id, mission.id)
        mission_inv.destroy unless mission_inv.blank?
      end
    end

    update_mission_success_flg = true
    respond_to do |format|
      if update_mission_success_flg
        format.json { head :no_content }
      else
        format.json { head :no_content, status: :unprocessable_entity }
      end
    end  
  end

  # DELETE /medium_houdd_users/1/delete_mission/1
  def delete_mission
    @medium_mission = MediumMission.find(params[:mission_id])
    @medium_mission.destroy

    delete_mission_save_success_flg = true
    respond_to do |format|
      if delete_mission_save_success_flg
        format.json { head :no_content }
      else
        format.json { head :no_content, status: :unprocessable_entity }
      end
    end  
  end

  # GET /medium_houdd_users/1/add_strategy
  def add_strategy
    @strategy_id = nil
    @strategy_name = nil
    @strategy_script = nil
    render
  end

  # GET /medium_houdd_users/1/edit_strategy
  def edit_strategy
    strategy = MediumMissionStrategy.find(params[:strategy_id])
    @strategy_id = strategy.id
    @strategy_name = strategy.name
    @strategy_script = strategy.script
    render
  end

# POST /medium_houdd_users/1/update_strategy
  def update_strategy
    strategy = MediumMissionStrategy.find(params[:mypage]['strategy_id']) unless params[:mypage]['strategy_id'].blank?
    strategy = MediumMissionStrategy.new if strategy.blank?
    strategy.medium_houdd_user_id = params[:id]
    strategy.name = params[:mypage]['name']
    strategy.script = params[:mypage]['script']
    strategy.save

    update_strategy_success_flg = true
    respond_to do |format|
      if update_strategy_success_flg
        format.json { head :no_content }
      else
        format.json { head :no_content, status: :unprocessable_entity }
      end
    end  
  end

  # DELETE /medium_houdd_users/1/delete_strategy/1
  def delete_strategy
    @medium_strategy = MediumMissionStrategy.find(params[:strategy_id])
    @medium_strategy.destroy

    delete_strategy_save_success_flg = true
    respond_to do |format|
      if delete_strategy_save_success_flg
        format.json { head :no_content }
      else
        format.json { head :no_content, status: :unprocessable_entity }
      end
    end  
  end

  # GET /medium_houdd_users/1/proceed_construction
  def proceed_construction
    MediumUpdateConstructionQue.execute
    render
  end

  # GET /medium_houdd_users/1/proceed_item_manufacture
  def proceed_item_manufacture
    10.times do |i|
      MediumUpdateItemManufactureQue.execute
    end
    render
  end

  # GET /medium_houdd_users/1/proceed_research
  def proceed_research
    MediumUpdateResearch.execute
    render
  end
end
