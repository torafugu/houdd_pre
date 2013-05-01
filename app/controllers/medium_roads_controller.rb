class MediumRoadsController < ApplicationController
  # GET /medium_roads
  # GET /medium_roads.json
  def index
    @medium_roads = MediumRoad.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @medium_roads }
    end
  end

  # GET /medium_roads/1
  # GET /medium_roads/1.json
  def show
    @medium_road = MediumRoad.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @medium_road }
    end
  end

  # GET /medium_roads/new
  # GET /medium_roads/new.json
  def new
    @medium_road = MediumRoad.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @medium_road }
    end
  end

  # GET /medium_roads/1/edit
  def edit
    @medium_road = MediumRoad.find(params[:id])
  end

  # POST /medium_roads
  # POST /medium_roads.json
  def create
    @medium_road = MediumRoad.new(params[:medium_road])

    respond_to do |format|
      if @medium_road.save
        format.html { redirect_to @medium_road, notice: 'Medium road was successfully created.' }
        format.json { render json: @medium_road, status: :created, location: @medium_road }
      else
        format.html { render action: "new" }
        format.json { render json: @medium_road.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /medium_roads/1
  # PUT /medium_roads/1.json
  def update
    @medium_road = MediumRoad.find(params[:id])

    respond_to do |format|
      if @medium_road.update_attributes(params[:medium_road])
        format.html { redirect_to @medium_road, notice: 'Medium road was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @medium_road.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /medium_roads/1
  # DELETE /medium_roads/1.json
  def destroy
    @medium_road = MediumRoad.find(params[:id])
    @medium_road.destroy

    respond_to do |format|
      format.html { redirect_to medium_roads_url }
      format.json { head :no_content }
    end
  end
end
