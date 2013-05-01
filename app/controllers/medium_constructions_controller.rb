class MediumConstructionsController < ApplicationController
  # GET /medium_constructions
  # GET /medium_constructions.json
  def index
    @medium_constructions = MediumConstruction.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @medium_constructions }
    end
  end

  # GET /medium_constructions/1
  # GET /medium_constructions/1.json
  def show
    @medium_construction = MediumConstruction.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @medium_construction }
    end
  end

  # GET /medium_constructions/new
  # GET /medium_constructions/new.json
  def new
    @medium_construction = MediumConstruction.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @medium_construction }
    end
  end

  # GET /medium_constructions/1/edit
  def edit
    @medium_construction = MediumConstruction.find(params[:id])
  end

  # POST /medium_constructions
  # POST /medium_constructions.json
  def create
    @medium_construction = MediumConstruction.new(params[:medium_construction])

    respond_to do |format|
      if @medium_construction.save
        format.html { redirect_to @medium_construction, notice: 'Medium construction was successfully created.' }
        format.json { render json: @medium_construction, status: :created, location: @medium_construction }
      else
        format.html { render action: "new" }
        format.json { render json: @medium_construction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /medium_constructions/1
  # PUT /medium_constructions/1.json
  def update
    @medium_construction = MediumConstruction.find(params[:id])

    respond_to do |format|
      if @medium_construction.update_attributes(params[:medium_construction])
        format.html { redirect_to @medium_construction, notice: 'Medium construction was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @medium_construction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /medium_constructions/1
  # DELETE /medium_constructions/1.json
  def destroy
    @medium_construction = MediumConstruction.find(params[:id])
    @medium_construction.destroy

    respond_to do |format|
      format.html { redirect_to medium_constructions_url }
      format.json { head :no_content }
    end
  end
end
