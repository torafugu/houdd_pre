class MediumTerrainsController < ApplicationController
  # GET /medium_terrains
  # GET /medium_terrains.json
  def index
    @medium_terrains = MediumTerrain.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @medium_terrains }
    end
  end

  # GET /medium_terrains/1
  # GET /medium_terrains/1.json
  def show
    @medium_terrain = MediumTerrain.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @medium_terrain }
    end
  end

  # GET /medium_terrains/new
  # GET /medium_terrains/new.json
  def new
    @medium_terrain = MediumTerrain.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @medium_terrain }
    end
  end

  # GET /medium_terrains/1/edit
  def edit
    @medium_terrain = MediumTerrain.find(params[:id])
  end

  # POST /medium_terrains
  # POST /medium_terrains.json
  def create
    @medium_terrain = MediumTerrain.new(params[:medium_terrain])

    respond_to do |format|
      if @medium_terrain.save
        format.html { redirect_to @medium_terrain, notice: 'Medium terrain was successfully created.' }
        format.json { render json: @medium_terrain, status: :created, location: @medium_terrain }
      else
        format.html { render action: "new" }
        format.json { render json: @medium_terrain.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /medium_terrains/1
  # PUT /medium_terrains/1.json
  def update
    @medium_terrain = MediumTerrain.find(params[:id])

    respond_to do |format|
      if @medium_terrain.update_attributes(params[:medium_terrain])
        format.html { redirect_to @medium_terrain, notice: 'Medium terrain was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @medium_terrain.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /medium_terrains/1
  # DELETE /medium_terrains/1.json
  def destroy
    @medium_terrain = MediumTerrain.find(params[:id])
    @medium_terrain.destroy

    respond_to do |format|
      format.html { redirect_to medium_terrains_url }
      format.json { head :no_content }
    end
  end
end
