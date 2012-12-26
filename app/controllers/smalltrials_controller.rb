class SmalltrialsController < ApplicationController
  # GET /smalltrials
  # GET /smalltrials.json
  def index
    @smalltrials = Smalltrial.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @smalltrials }
    end
  end

  # GET /smalltrials/1
  # GET /smalltrials/1.json
  def show
    @smalltrial = Smalltrial.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @smalltrial }
    end
  end

  # GET /smalltrials/new
  # GET /smalltrials/new.json
  def new
    @smalltrial = Smalltrial.new
    max_id = Smalltrial.maximum(:id)
    max_id = 1 if max_id.nil?
    next_id = max_id + 1
    @smallmaps = Smallmap.where('start_trial_id <= ?', next_id).where('end_trial_id >= ?', next_id)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @smalltrial }
    end
  end

  # GET /smalltrials/1/edit
  def edit
    @smalltrial = Smalltrial.find(params[:id])
    @smallmaps = Smallmap.where('start_trial_id <= ?', params[:id]).where('end_trial_id >= ?',params[:id])
  end

  # POST /smalltrials
  # POST /smalltrials.json
  def create
    @smalltrial = Smalltrial.new(params[:smalltrial])

    respond_to do |format|
      if @smalltrial.save
        format.html { redirect_to @smalltrial, notice: 'Smalltrial was successfully created.' }
        format.json { render json: @smalltrial, status: :created, location: @smalltrial }
      else
        format.html { render action: "new" }
        format.json { render json: @smalltrial.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /smalltrials/1
  # PUT /smalltrials/1.json
  def update
    @smalltrial = Smalltrial.find(params[:id])

    respond_to do |format|
      if @smalltrial.update_attributes(params[:smalltrial])
        format.html { redirect_to @smalltrial, notice: 'Smalltrial was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @smalltrial.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /smalltrials/1
  # DELETE /smalltrials/1.json
  def destroy
    @smalltrial = Smalltrial.find(params[:id])
    @smalltrial.destroy

    respond_to do |format|
      format.html { redirect_to smalltrials_url }
      format.json { head :no_content }
    end
  end

  # GET /smalltrials/select_mobunits
  # GET /smalltrials/1/select_mobunits
  def select_mobunits
    @def_unit_data = Smallmobunit.where('smallmap_id = ?', params[:map_id]).where('is_prepared = "t"').where('is_guard = "t"').collect{|m| [m.name, m.id]}
    @atk_unit_data = Smallmobunit.where('smallmap_id = ?', params[:map_id]).where('is_prepared = "t"').where('is_guard = "f"').collect{|m| [m.name, m.id]}
    render
  end

  # GET /smalltrials/1/log
  def log
    @smalltrial = Smalltrial.find(params[:id])
    @start_turn = 0
    if @smalltrial.smalltrialstatus.id == 3
      @last_turn = @smalltrial.smalltrialturns.size - 1
      @last_turn = 0 if @smalltrial.smalltrialturns.size == 1
      @def_squads = Smalltrialmoblineup.find_all_by_is_guard(true).collect{|s| {"id"=>s.squad_id, "name"=> s.squad_name}}.uniq
      @atk_squads = Smalltrialmoblineup.find_all_by_is_guard(false).collect{|s| {"id"=>s.squad_id, "name"=> s.squad_name}}.uniq
    else
      @last_turn = 0
    end
    render
  end

  # GET /smalltrials/1/execute
  def execute
    Smallturncreator.create_all_by_id(params[:id])
    render
  end

  # GET /smalltrials/1/check_log
  def check_log
    turn_index = params[:turn].to_i
    @current_turn = Smalltrialturn.find_all_by_smalltrial_id(params[:id])[turn_index]
    render
  end

end
