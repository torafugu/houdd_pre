class MediumMissionStrategiesController < ApplicationController
  # GET /medium_mission_strategies
  # GET /medium_mission_strategies.json
  def index
    @medium_mission_strategies = MediumMissionStrategy.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @medium_mission_strategies }
    end
  end

  # GET /medium_mission_strategies/1
  # GET /medium_mission_strategies/1.json
  def show
    @medium_mission_strategy = MediumMissionStrategy.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @medium_mission_strategy }
    end
  end

  # GET /medium_mission_strategies/new
  # GET /medium_mission_strategies/new.json
  def new
    @medium_mission_strategy = MediumMissionStrategy.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @medium_mission_strategy }
    end
  end

  # GET /medium_mission_strategies/1/edit
  def edit
    @medium_mission_strategy = MediumMissionStrategy.find(params[:id])
  end

  # POST /medium_mission_strategies
  # POST /medium_mission_strategies.json
  def create
    @medium_mission_strategy = MediumMissionStrategy.new(params[:medium_mission_strategy])

    respond_to do |format|
      if @medium_mission_strategy.save
        format.html { redirect_to @medium_mission_strategy, notice: 'Medium mission strategy was successfully created.' }
        format.json { render json: @medium_mission_strategy, status: :created, location: @medium_mission_strategy }
      else
        format.html { render action: "new" }
        format.json { render json: @medium_mission_strategy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /medium_mission_strategies/1
  # PUT /medium_mission_strategies/1.json
  def update
    @medium_mission_strategy = MediumMissionStrategy.find(params[:id])

    respond_to do |format|
      if @medium_mission_strategy.update_attributes(params[:medium_mission_strategy])
        format.html { redirect_to @medium_mission_strategy, notice: 'Medium mission strategy was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @medium_mission_strategy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /medium_mission_strategies/1
  # DELETE /medium_mission_strategies/1.json
  def destroy
    @medium_mission_strategy = MediumMissionStrategy.find(params[:id])
    @medium_mission_strategy.destroy

    respond_to do |format|
      format.html { redirect_to medium_mission_strategies_url }
      format.json { head :no_content }
    end
  end
end
