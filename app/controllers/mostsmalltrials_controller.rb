class MostsmalltrialsController < ApplicationController
  # GET /mostsmalltrials
  # GET /mostsmalltrials.json
  def index
    @mostsmalltrials = Mostsmalltrial.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mostsmalltrials }
    end
  end

  # GET /mostsmalltrials/1
  # GET /mostsmalltrials/1.json
  def show
    @mostsmalltrial = Mostsmalltrial.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mostsmalltrial }
    end
  end

  # GET /mostsmalltrials/new
  # GET /mostsmalltrials/new.json
  def new
    @mostsmalltrial = Mostsmalltrial.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mostsmalltrial }
    end
  end

  # GET /mostsmalltrials/1/edit
  def edit
    @mostsmalltrial = Mostsmalltrial.find(params[:id])
  end

  # POST /mostsmalltrials
  # POST /mostsmalltrials.json
  def create
    @mostsmalltrial = Mostsmalltrial.new(params[:mostsmalltrial])

    respond_to do |format|
      if @mostsmalltrial.save
        format.html { redirect_to @mostsmalltrial, notice: 'Mostsmalltrial was successfully created.' }
        format.json { render json: @mostsmalltrial, status: :created, location: @mostsmalltrial }
      else
        format.html { render action: "new" }
        format.json { render json: @mostsmalltrial.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mostsmalltrials/1
  # PUT /mostsmalltrials/1.json
  def update
    @mostsmalltrial = Mostsmalltrial.find(params[:id])

    respond_to do |format|
      if @mostsmalltrial.update_attributes(params[:mostsmalltrial])
        format.html { redirect_to @mostsmalltrial, notice: 'Mostsmalltrial was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mostsmalltrial.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mostsmalltrials/1
  # DELETE /mostsmalltrials/1.json
  def destroy
    @mostsmalltrial = Mostsmalltrial.find(params[:id])
    @mostsmalltrial.destroy

    respond_to do |format|
      format.html { redirect_to mostsmalltrials_url }
      format.json { head :no_content }
    end
  end

  # GET /mostsmalltrials/select_missions
  # GET /mostsmalltrials/1/select_missions
  def select_missions
    @def_missions = Mostsmallmission.find_all_by_mostsmallterritory_id_and_mostsmallmissioncategory_id(params[:territory_id], 2).collect{|m| [m.name, m.id]}
    @atk_missions = Mostsmallmission.find_all_by_mostsmallterritory_id_and_mostsmallmissioncategory_id(params[:territory_id], 1).collect{|m| [m.name, m.id]}
    @mostsmallterritory = Mostsmallterritory.find(params[:territory_id])
    render
  end

  # GET /mostsmalltrials/1/log
  def log
    @trial = Mostsmalltrial.find(params[:id])
    @start_turn = 0
    unless @trial.occured_at.nil?
      @start_turn = 1
      @last_turn = @trial.mostsmalltrialturns.size
    else
      @last_turn = 0
    end
    render
  end

  # GET /mostsmalltrials/1/check_log
  def check_log
    turn_index = params[:turn].to_i - 1
    turn_index = 0 if turn_index < 0
    @current_turn = Mostsmalltrialturn.find_all_by_mostsmalltrial_id(params[:id])[turn_index]
    @start_battle_turn = 0
    @last_battle_turn = 0
    @start_battleset_turn = 0
    @last_battleset_turn = 0
    unless @current_turn.mostsmallbattlesets.blank?
      @current_battleset = @current_turn.mostsmallbattlesets.first
      @start_battleset_turn = 1
      @last_battleset_turn = @current_turn.mostsmallbattlesets.size
      @current_battleturn = @current_battleset.mostsmallbattleturns.first
      unless @current_battleset.blank? 
        @start_battle_turn = 1
        @last_battle_turn = @current_battleset.mostsmallbattleturns.size
      end
    end
    render
  end

  # GET /mostsmalltrials/1/check_battleset
  def check_battleset
    turn_index = params[:turn].to_i - 1
    turn_index = 0 if turn_index < 0
    battleset_index = params[:battleset].to_i - 1
    battleset_index = 0 if battleset_index < 0
    current_turn = Mostsmalltrialturn.find_all_by_mostsmalltrial_id(params[:id])[turn_index]
    @current_battleset = current_turn.mostsmallbattlesets[battleset_index]
    @start_battle_turn = 1
    @last_battle_turn = @current_battleset.mostsmallbattleturns.size
    @current_battleturn = @current_battleset.mostsmallbattleturns.first
  end

  # GET /mostsmalltrials/1/check_battlelog
  def check_battlelog
    turn_index = params[:turn].to_i - 1
    turn_index = 0 if turn_index < 0
    battleset_index = params[:battleset].to_i - 1
    battleset_index = 0 if battleset_index < 0
    battleturn_index = params[:battleturn].to_i - 1
    battleturn_index = 0 if battleturn_index < 0
    current_turn = Mostsmalltrialturn.find_all_by_mostsmalltrial_id(params[:id])[turn_index]
    current_battleset = current_turn.mostsmallbattlesets[battleset_index]
    @current_battleturn = current_battleset.mostsmallbattleturns[battleturn_index]
    @is_start_battle_turn = false
    @is_start_battle_turn = true if battleturn_index == 0
  end
end
