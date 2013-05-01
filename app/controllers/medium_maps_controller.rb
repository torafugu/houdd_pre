class MediumMapsController < ApplicationController
  # GET /medium_maps
  # GET /medium_maps.json
  def index
    @medium_maps = MediumMap.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @medium_maps }
    end
  end

  # GET /medium_maps/1
  # GET /medium_maps/1.json
  def show
    @medium_map = MediumMap.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @medium_map }
    end
  end

  # GET /medium_maps/new
  # GET /medium_maps/new.json
  def new
    @medium_map = MediumMap.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @medium_map }
    end
  end

  # GET /medium_maps/1/edit
  def edit
    @medium_map = MediumMap.find(params[:id])
  end

  # POST /medium_maps
  # POST /medium_maps.json
  def create
    @medium_map = MediumMap.new(params[:medium_map])

    respond_to do |format|
      if @medium_map.save
        format.html { redirect_to @medium_map, notice: 'Medium map was successfully created.' }
        format.json { render json: @medium_map, status: :created, location: @medium_map }
      else
        format.html { render action: "new" }
        format.json { render json: @medium_map.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /medium_maps/1
  # PUT /medium_maps/1.json
  def update
    @medium_map = MediumMap.find(params[:id])

    respond_to do |format|
      if @medium_map.update_attributes(params[:medium_map])
        format.html { redirect_to @medium_map, notice: 'Medium map was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @medium_map.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /medium_maps/1
  # DELETE /medium_maps/1.json
  def destroy
    @medium_map = MediumMap.find(params[:id])
    @medium_map.destroy

    respond_to do |format|
      format.html { redirect_to medium_maps_url }
      format.json { head :no_content }
    end
  end
end
