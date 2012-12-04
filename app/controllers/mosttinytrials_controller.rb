class MosttinytrialsController < ApplicationController
  # GET /mosttinytrials
  # GET /mosttinytrials.json
  def index
    @mosttinytrials = Mosttinytrial.all(:include => [:def_user, :atk_user, :def_strategy, :atk_strategy, :map])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mosttinytrials }
    end
  end

  # GET /mosttinytrials/1
  # GET /mosttinytrials/1.json
  def show
    @mosttinytrial = Mosttinytrial.find(params[:id], :include => [:def_user, :atk_user, :def_strategy, :atk_strategy, :map])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mosttinytrial }
    end
  end

  # GET /mosttinytrials/new
  # GET /mosttinytrials/new.json
  def new
    @mosttinytrial = Mosttinytrial.new

    @gurad_mobs_size = Mosttinymob.find_all_by_mosttinyuser_id(2).size
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mosttinytrial }
    end
  end

  # GET /mosttinytrials/1/edit
  def edit
    @mosttinytrial = Mosttinytrial.find(params[:id])
  end

  # POST /mosttinytrials
  # POST /mosttinytrials.json
  def create
    @mosttinytrial = Mosttinytrial.new(params[:mosttinytrial])

    respond_to do |format|
      if @mosttinytrial.save
        format.html { redirect_to @mosttinytrial, notice: 'Mosttinytrial was successfully created.' }
        format.json { render json: @mosttinytrial, status: :created, location: @mosttinytrial }
      else
        format.html { render action: "new" }
        format.json { render json: @mosttinytrial.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mosttinytrials/1
  # PUT /mosttinytrials/1.json
  def update
    @mosttinytrial = Mosttinytrial.find(params[:id])

    respond_to do |format|
      if @mosttinytrial.update_attributes(params[:mosttinytrial])
        format.html { redirect_to @mosttinytrial, notice: 'Mosttinytrial was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mosttinytrial.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mosttinytrials/1
  # DELETE /mosttinytrials/1.json
  def destroy
    @mosttinytrial = Mosttinytrial.find(params[:id])
    @mosttinytrial.destroy

    respond_to do |format|
      format.html { redirect_to mosttinytrials_url }
      format.json { head :no_content }
    end
  end
  # GET /mosttinytrials/select_map_and_def_mobs
  # GET /mosttinytrials/1/select_map_and_def_mobs
  def select_map_and_def_mobs
    @def_map = Mosttinymap.find_all_by_mosttinyuser_id(params[:def_user_id])
    @def_mob_size = Mosttinymob.find_all_by_mosttinyuser_id(params[:def_user_id]).size.to_s
    @def_bench_mob = Mosttinytrial.find(params[:id]).def_bench_mob_ids_and_names_by_user(params[:def_user_id])
    @def_setup_mob = Mosttinytrial.find(params[:id]).def_setup_mob_ids_and_names_by_user(params[:def_user_id])
    render
  end
  
  # GET /mosttinytrials/select_atk_mobs
  # GET /mosttinytrials/1/select_def_mobs
  def select_atk_mobs
    @atk_mob_size = Mosttinymob.find_all_by_mosttinyuser_id(params[:atk_user_id]).size
    @atk_bench_mob = Mosttinytrial.find(params[:id]).def_bench_mob_ids_and_names_by_user(params[:atk_user_id])
    @atk_setup_mob = Mosttinytrial.find(params[:id]).def_setup_mob_ids_and_names_by_user(params[:atk_user_id])
    render
  end
  
  # GET /mosttinytrials/1/start
  def start
    @mosttinytrial = Mosttinytrial.find(params[:id], :include => [:def_user, :atk_user, :def_strategy, :atk_strategy, :map, {:mosttinymobsetups => {:mosttinymob => :mosttinymobinfo}}])
  end

  # GET /mosttinytrials/1/execute
  def execute
    Mosttinyturncreator.create_all_by_id(params[:id])
    @max_turn = Mosttinyturn.find_all_by_mosttinytrial_id(params[:id]).size
    @current_turn = Mosttinyturn.find_all_by_mosttinytrial_id(params[:id], :include => [{:mosttinymobtrails => {:mosttinymobsetup => :mosttinymob}}, :mosttinybattles])[0]
    render
  end

  # GET /mosttinytrials/1/check_log
  def check_log
    turn_index = params[:turn].to_i - 1
    turn_index = 0 if turn_index < 0 
    @current_turn = Mosttinyturn.find_all_by_mosttinytrial_id(params[:id], :include => [{:mosttinymobtrails => {:mosttinymobsetup => :mosttinymob}}, :mosttinybattles])[turn_index]
    render
  end
end
