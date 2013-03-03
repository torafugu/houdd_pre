class MostsmallequipslotinventoriesController < ApplicationController
  # GET /mostsmallequipslotinventories
  # GET /mostsmallequipslotinventories.json
  def index
    @mostsmallequipslotinventories = Mostsmallequipslotinventory.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mostsmallequipslotinventories }
    end
  end

  # GET /mostsmallequipslotinventories/1
  # GET /mostsmallequipslotinventories/1.json
  def show
    @mostsmallequipslotinventory = Mostsmallequipslotinventory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mostsmallequipslotinventory }
    end
  end

  # GET /mostsmallequipslotinventories/new
  # GET /mostsmallequipslotinventories/new.json
  def new
    @mostsmallequipslotinventory = Mostsmallequipslotinventory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mostsmallequipslotinventory }
    end
  end

  # GET /mostsmallequipslotinventories/1/edit
  def edit
    @mostsmallequipslotinventory = Mostsmallequipslotinventory.find(params[:id])
  end

  # POST /mostsmallequipslotinventories
  # POST /mostsmallequipslotinventories.json
  def create
    @mostsmallequipslotinventory = Mostsmallequipslotinventory.new(params[:mostsmallequipslotinventory])

    respond_to do |format|
      if @mostsmallequipslotinventory.save
        format.html { redirect_to @mostsmallequipslotinventory, notice: 'Mostsmallequipslotinventory was successfully created.' }
        format.json { render json: @mostsmallequipslotinventory, status: :created, location: @mostsmallequipslotinventory }
      else
        format.html { render action: "new" }
        format.json { render json: @mostsmallequipslotinventory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mostsmallequipslotinventories/1
  # PUT /mostsmallequipslotinventories/1.json
  def update
    @mostsmallequipslotinventory = Mostsmallequipslotinventory.find(params[:id])

    respond_to do |format|
      if @mostsmallequipslotinventory.update_attributes(params[:mostsmallequipslotinventory])
        format.html { redirect_to @mostsmallequipslotinventory, notice: 'Mostsmallequipslotinventory was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mostsmallequipslotinventory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mostsmallequipslotinventories/1
  # DELETE /mostsmallequipslotinventories/1.json
  def destroy
    @mostsmallequipslotinventory = Mostsmallequipslotinventory.find(params[:id])
    @mostsmallequipslotinventory.destroy

    respond_to do |format|
      format.html { redirect_to mostsmallequipslotinventories_url }
      format.json { head :no_content }
    end
  end
end
