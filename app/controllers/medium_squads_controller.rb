class MediumSquadsController < ApplicationController
  # GET /medium_squads
  # GET /medium_squads.json
  def index
    @medium_squads = MediumSquad.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @medium_squads }
    end
  end

  # GET /medium_squads/1
  # GET /medium_squads/1.json
  def show
    @medium_squad = MediumSquad.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @medium_squad }
    end
  end

  # GET /medium_squads/new
  # GET /medium_squads/new.json
  def new
    @medium_squad = MediumSquad.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @medium_squad }
    end
  end

  # GET /medium_squads/1/edit
  def edit
    @medium_squad = MediumSquad.find(params[:id])
  end

  # POST /medium_squads
  # POST /medium_squads.json
  def create
    @medium_squad = MediumSquad.new(params[:medium_squad])

    respond_to do |format|
      if @medium_squad.save
        format.html { redirect_to @medium_squad, notice: 'Medium squad was successfully created.' }
        format.json { render json: @medium_squad, status: :created, location: @medium_squad }
      else
        format.html { render action: "new" }
        format.json { render json: @medium_squad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /medium_squads/1
  # PUT /medium_squads/1.json
  def update
    @medium_squad = MediumSquad.find(params[:id])

    respond_to do |format|
      if @medium_squad.update_attributes(params[:medium_squad])
        format.html { redirect_to @medium_squad, notice: 'Medium squad was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @medium_squad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /medium_squads/1
  # DELETE /medium_squads/1.json
  def destroy
    @medium_squad = MediumSquad.find(params[:id])
    @medium_squad.destroy

    respond_to do |format|
      format.html { redirect_to medium_squads_url }
      format.json { head :no_content }
    end
  end
end
