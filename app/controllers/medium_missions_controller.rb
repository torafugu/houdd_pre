class MediumMissionsController < ApplicationController
  # GET /medium_missions
  # GET /medium_missions.json
  def index
    @medium_missions = MediumMission.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @medium_missions }
    end
  end

  # GET /medium_missions/1
  # GET /medium_missions/1.json
  def show
    @medium_mission = MediumMission.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @medium_mission }
    end
  end

  # GET /medium_missions/new
  # GET /medium_missions/new.json
  def new
    @medium_mission = MediumMission.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @medium_mission }
    end
  end

  # GET /medium_missions/1/edit
  def edit
    @medium_mission = MediumMission.find(params[:id])
  end

  # POST /medium_missions
  # POST /medium_missions.json
  def create
    @medium_mission = MediumMission.new(params[:medium_mission])

    respond_to do |format|
      if @medium_mission.save
        format.html { redirect_to @medium_mission, notice: 'Medium mission was successfully created.' }
        format.json { render json: @medium_mission, status: :created, location: @medium_mission }
      else
        format.html { render action: "new" }
        format.json { render json: @medium_mission.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /medium_missions/1
  # PUT /medium_missions/1.json
  def update
    @medium_mission = MediumMission.find(params[:id])

    respond_to do |format|
      if @medium_mission.update_attributes(params[:medium_mission])
        format.html { redirect_to @medium_mission, notice: 'Medium mission was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @medium_mission.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /medium_missions/1
  # DELETE /medium_missions/1.json
  def destroy
    @medium_mission = MediumMission.find(params[:id])
    @medium_mission.destroy

    respond_to do |format|
      format.html { redirect_to medium_missions_url }
      format.json { head :no_content }
    end
  end
end
