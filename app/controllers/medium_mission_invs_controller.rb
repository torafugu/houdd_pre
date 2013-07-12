class MediumMissionInvsController < ApplicationController
  # GET /medium_mission_invs
  # GET /medium_mission_invs.json
  def index
    @medium_mission_invs = MediumMissionInv.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @medium_mission_invs }
    end
  end

  # GET /medium_mission_invs/1
  # GET /medium_mission_invs/1.json
  def show
    @medium_mission_inv = MediumMissionInv.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @medium_mission_inv }
    end
  end

  # GET /medium_mission_invs/new
  # GET /medium_mission_invs/new.json
  def new
    @medium_mission_inv = MediumMissionInv.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @medium_mission_inv }
    end
  end

  # GET /medium_mission_invs/1/edit
  def edit
    @medium_mission_inv = MediumMissionInv.find(params[:id])
  end

  # POST /medium_mission_invs
  # POST /medium_mission_invs.json
  def create
    @medium_mission_inv = MediumMissionInv.new(params[:medium_mission_inv])

    respond_to do |format|
      if @medium_mission_inv.save
        format.html { redirect_to @medium_mission_inv, notice: 'Medium mission inv was successfully created.' }
        format.json { render json: @medium_mission_inv, status: :created, location: @medium_mission_inv }
      else
        format.html { render action: "new" }
        format.json { render json: @medium_mission_inv.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /medium_mission_invs/1
  # PUT /medium_mission_invs/1.json
  def update
    @medium_mission_inv = MediumMissionInv.find(params[:id])

    respond_to do |format|
      if @medium_mission_inv.update_attributes(params[:medium_mission_inv])
        format.html { redirect_to @medium_mission_inv, notice: 'Medium mission inv was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @medium_mission_inv.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /medium_mission_invs/1
  # DELETE /medium_mission_invs/1.json
  def destroy
    @medium_mission_inv = MediumMissionInv.find(params[:id])
    @medium_mission_inv.destroy

    respond_to do |format|
      format.html { redirect_to medium_mission_invs_url }
      format.json { head :no_content }
    end
  end
end
