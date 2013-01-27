class MoresmalltrialsController < ApplicationController
  # GET /moresmalltrials
  # GET /moresmalltrials.json
  def index
    @moresmalltrials = Moresmalltrial.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @moresmalltrials }
    end
  end

  # GET /moresmalltrials/1
  # GET /moresmalltrials/1.json
  def show
    @moresmalltrial = Moresmalltrial.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @moresmalltrial }
    end
  end

  # GET /moresmalltrials/new
  # GET /moresmalltrials/new.json
  def new
    @moresmalltrial = Moresmalltrial.new
    max_id = Moresmalltrial.maximum(:id)
    max_id = 1 if max_id.nil?
    next_id = max_id + 1
    @moresmallmaps = Moresmallmap.where('start_trial_id <= ?', next_id).where('end_trial_id >= ?', next_id)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @moresmalltrial }
    end
  end

  # GET /moresmalltrials/1/edit
  def edit
    @moresmalltrial = Moresmalltrial.find(params[:id])
    @moresmallmaps = Moresmallmap.where('start_trial_id <= ?', params[:id]).where('end_trial_id >= ?',params[:id])
  end

  # POST /moresmalltrials
  # POST /moresmalltrials.json
  def create
    @moresmalltrial = Moresmalltrial.new(params[:moresmalltrial])

    respond_to do |format|
      if @moresmalltrial.save
        format.html { redirect_to @moresmalltrial, notice: 'Moresmalltrial was successfully created.' }
        format.json { render json: @moresmalltrial, status: :created, location: @moresmalltrial }
      else
        format.html { render action: "new" }
        format.json { render json: @moresmalltrial.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /moresmalltrials/1
  # PUT /moresmalltrials/1.json
  def update
    @moresmalltrial = Moresmalltrial.find(params[:id])

    respond_to do |format|
      if @moresmalltrial.update_attributes(params[:moresmalltrial])
        format.html { redirect_to @moresmalltrial, notice: 'Moresmalltrial was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @moresmalltrial.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /moresmalltrials/1
  # DELETE /moresmalltrials/1.json
  def destroy
    @moresmalltrial = Moresmalltrial.find(params[:id])
    @moresmalltrial.destroy

    respond_to do |format|
      format.html { redirect_to moresmalltrials_url }
      format.json { head :no_content }
    end
  end

  # GET /moresmalltrials/select_mobunits
  # GET /moresmalltrials/1/select_mobunits
  def select_mobunits
    @def_unit_data = Moresmallmobunit.where('cur_map_id = ?', params[:map_id]).where('tgt_map_id = ?', params[:map_id]).where('is_prepared = "t"').collect{|m| [m.name, m.id]}
    @atk_unit_data = Moresmallmobunit.where('cur_map_id != ?', params[:map_id]).where('tgt_map_id = ?', params[:map_id]).where('is_prepared = "t"').collect{|m| [m.name, m.id]}
    render
  end

  # GET /moresmalltrials/1/log
  def log
    @trial = Moresmalltrial.find(params[:id])
    @start_turn = 0
    if @trial.moresmalltrialstatus.id == 3
      @last_turn = @trial.moresmalltrialturns.size - 1
      @last_turn = 0 if @trial.moresmalltrialturns.size == 1
      @def_squads = Moresmalltrialsquadpers.find_all_by_mobunit_id(@trial.def_mobunit_id)
      @atk_squads = Moresmalltrialsquadpers.find_all_by_mobunit_id(@trial.atk_mobunit_id)
    else
      @last_turn = 0
    end
    render
  end

  # GET /moresmalltrials/1/execute
  def execute
    Moresmallturncreator.create_all_by_id(params[:id])
    render
  end

  # GET /moresmalltrials/1/check_log
  def check_log
    turn_index = params[:turn].to_i
    @current_turn = Moresmalltrialturn.find_all_by_moresmalltrial_id(params[:id])[turn_index]
    @current_battleturn = Moresmallbattleturn.find_all_by_moresmalltrialturn_id(@current_turn.id)[0]
    @start_battle_turn = 0
    @last_battle_turn = @current_turn.moresmallbattleturns.size - 1
    @last_battle_turn = 0 if @current_turn.moresmallbattleturns.size == 0
    render
  end

  # GET /moresmalltrials/1/check_battlelog
  def check_battlelog
    turn_index = params[:turn].to_i
    @current_turn_id = Moresmalltrialturn.find_all_by_moresmalltrial_id(params[:id])[turn_index].id
    battleturn_index = params[:battleturn].to_i
    @current_battleturn = Moresmallbattleturn.find_all_by_moresmalltrialturn_id(@current_turn_id)[battleturn_index]
    @is_start_battle_turn = false
    @is_start_battle_turn = true if battleturn_index == 0
    render
  end
end
