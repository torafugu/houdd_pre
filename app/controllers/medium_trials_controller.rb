class MediumTrialsController < ApplicationController
  # GET /medium_trials
  # GET /medium_trials.json
  def index
    @medium_trials = MediumTrial.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @medium_trials }
    end
  end

  # GET /medium_trials/1
  # GET /medium_trials/1.json
  def show
    @medium_trial = MediumTrial.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @medium_trial }
    end
  end

  # GET /medium_trials/new
  # GET /medium_trials/new.json
  def new
    @medium_trial = MediumTrial.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @medium_trial }
    end
  end

  # GET /medium_trials/1/edit
  def edit
    @medium_trial = MediumTrial.find(params[:id])
  end

  # POST /medium_trials
  # POST /medium_trials.json
  def create
    @medium_trial = MediumTrial.new(params[:medium_trial])

    respond_to do |format|
      if @medium_trial.save
        format.html { redirect_to @medium_trial, notice: 'Medium trial was successfully created.' }
        format.json { render json: @medium_trial, status: :created, location: @medium_trial }
      else
        format.html { render action: "new" }
        format.json { render json: @medium_trial.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /medium_trials/1
  # PUT /medium_trials/1.json
  def update
    @medium_trial = MediumTrial.find(params[:id])

    respond_to do |format|
      if @medium_trial.update_attributes(params[:medium_trial])
        format.html { redirect_to @medium_trial, notice: 'Medium trial was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @medium_trial.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /medium_trials/1
  # DELETE /medium_trials/1.json
  def destroy
    @medium_trial = MediumTrial.find(params[:id])
    @medium_trial.destroy

    respond_to do |format|
      format.html { redirect_to medium_trials_url }
      format.json { head :no_content }
    end
  end
end
