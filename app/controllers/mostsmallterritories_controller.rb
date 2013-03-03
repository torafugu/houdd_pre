class MostsmallterritoriesController < ApplicationController
  # GET /mostsmallterritories
  # GET /mostsmallterritories.json
  def index
    @mostsmallterritories = Mostsmallterritory.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mostsmallterritories }
    end
  end

  # GET /mostsmallterritories/1
  # GET /mostsmallterritories/1.json
  def show
    @mostsmallterritory = Mostsmallterritory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mostsmallterritory }
    end
  end

  # GET /mostsmallterritories/new
  # GET /mostsmallterritories/new.json
  def new
    @mostsmallterritory = Mostsmallterritory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mostsmallterritory }
    end
  end

  # GET /mostsmallterritories/1/dungeon_edit
  def dungeon_edit
    @mostsmallterritory = Mostsmallterritory.find(params[:id])
  end

  # GET /mostsmallterritories/1/edit
  def edit
    @mostsmallterritory = Mostsmallterritory.find(params[:id])
  end

  # POST /mostsmallterritories
  # POST /mostsmallterritories.json
  def create
    @mostsmallterritory = Mostsmallterritory.new(params[:mostsmallterritory])

    respond_to do |format|
      if @mostsmallterritory.save
        format.html { redirect_to @mostsmallterritory, notice: 'Mostsmallterritory was successfully created.' }
        format.json { render json: @mostsmallterritory, status: :created, location: @mostsmallterritory }
      else
        format.html { render action: "new" }
        format.json { render json: @mostsmallterritory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mostsmallterritories/1
  # PUT /mostsmallterritories/1.json
  def update
    @mostsmallterritory = Mostsmallterritory.find(params[:id])

    respond_to do |format|
      if @mostsmallterritory.update_attributes(params[:mostsmallterritory])
        format.html { redirect_to @mostsmallterritory, notice: 'Mostsmallterritory was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mostsmallterritory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mostsmallterritories/1
  # DELETE /mostsmallterritories/1.json
  def destroy
    @mostsmallterritory = Mostsmallterritory.find(params[:id])
    @mostsmallterritory.destroy

    respond_to do |format|
      format.html { redirect_to mostsmallterritories_url }
      format.json { head :no_content }
    end
  end

  # GET /mostsmallterritories/random_map_txt
  def random_map_txt
    @random_map_txt =Mostsmallterritory.random_map_txt 
  end
end
