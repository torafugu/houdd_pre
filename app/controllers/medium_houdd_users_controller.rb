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

  # GET /medium_houdd_users/1/select_map_id
  def select_map_id
    @medium_map = MediumMap.find(params[:map_id]) unless params[:map_id].blank?
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
    MediumMobCreator.execute(params[:mobspecie_id], params[:mob_num].to_i)
    render
  end

  # GET /medium_houdd_users/1/delete_item_que
  def delete_item_que
    @medium_houdd_user = MediumHouddUser.find(params[:id])
    @medium_item_manufacture_que = MediumItemManufactureQue.find(params[:delete_id])
    @medium_item_manufacture_que.destroy
    render
  end

  # GET /medium_houdd_users/1/proceed_construction
  def proceed_construction
    MediumUpdateConstructionQue.execute
    render
  end

  # GET /medium_houdd_users/1/proceed_item_manufacture
  def proceed_item_manufacture
    MediumUpdateItemManufactureQue.execute
    render
  end

  # GET /medium_houdd_users/1/proceed_research
  def proceed_research
    MediumUpdateResearch.execute
    render
  end
end
