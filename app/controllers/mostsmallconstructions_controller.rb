class MostsmallconstructionsController < ApplicationController
  # GET /mostsmallconstructions
  # GET /mostsmallconstructions.json
  def index
    @mostsmallconstructions = Mostsmallconstruction.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mostsmallconstructions }
    end
  end

  # GET /mostsmallconstructions/1
  # GET /mostsmallconstructions/1.json
  def show
    @mostsmallconstruction = Mostsmallconstruction.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mostsmallconstruction }
    end
  end

  # GET /mostsmallconstructions/new
  # GET /mostsmallconstructions/new.json
  def new
    @mostsmallconstruction = Mostsmallconstruction.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mostsmallconstruction }
    end
  end

  # GET /mostsmallconstructions/1/edit
  def edit
    @mostsmallconstruction = Mostsmallconstruction.find(params[:id])
  end

  # POST /mostsmallconstructions
  # POST /mostsmallconstructions.json
  def create
    @mostsmallconstruction = Mostsmallconstruction.new(params[:mostsmallconstruction])

    respond_to do |format|
      if @mostsmallconstruction.save
        format.html { redirect_to @mostsmallconstruction, notice: 'Mostsmallconstruction was successfully created.' }
        format.json { render json: @mostsmallconstruction, status: :created, location: @mostsmallconstruction }
      else
        format.html { render action: "new" }
        format.json { render json: @mostsmallconstruction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mostsmallconstructions/1
  # PUT /mostsmallconstructions/1.json
  def update
    @mostsmallconstruction = Mostsmallconstruction.find(params[:id])

    respond_to do |format|
      if @mostsmallconstruction.update_attributes(params[:mostsmallconstruction])
        format.html { redirect_to @mostsmallconstruction, notice: 'Mostsmallconstruction was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mostsmallconstruction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mostsmallconstructions/1
  # DELETE /mostsmallconstructions/1.json
  def destroy
    @mostsmallconstruction = Mostsmallconstruction.find(params[:id])
    @mostsmallconstruction.destroy

    respond_to do |format|
      format.html { redirect_to mostsmallconstructions_url }
      format.json { head :no_content }
    end
  end

  # GET /mostsmallconstructions/select_maptxt
  # GET /mostsmallconstructions/1/select_maptxt
  def select_maptxt
    @map_txt =Mostsmallterritory.find(params[:territory_id]).map_txt 
  end
end


