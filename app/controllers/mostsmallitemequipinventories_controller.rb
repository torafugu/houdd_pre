class MostsmallitemequipinventoriesController < ApplicationController
  # GET /mostsmallitemequipinventories
  # GET /mostsmallitemequipinventories.json
  def index
    @mostsmallitemequipinventories = Mostsmallitemequipinventory.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mostsmallitemequipinventories }
    end
  end

  # GET /mostsmallitemequipinventories/1
  # GET /mostsmallitemequipinventories/1.json
  def show
    @mostsmallitemequipinventory = Mostsmallitemequipinventory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mostsmallitemequipinventory }
    end
  end

  # GET /mostsmallitemequipinventories/new
  # GET /mostsmallitemequipinventories/new.json
  def new
    @mostsmallitemequipinventory = Mostsmallitemequipinventory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mostsmallitemequipinventory }
    end
  end

  # GET /mostsmallitemequipinventories/1/edit
  def edit
    @mostsmallitemequipinventory = Mostsmallitemequipinventory.find(params[:id])
  end

  # POST /mostsmallitemequipinventories
  # POST /mostsmallitemequipinventories.json
  def create
    @mostsmallitemequipinventory = Mostsmallitemequipinventory.new(params[:mostsmallitemequipinventory])

    respond_to do |format|
      if @mostsmallitemequipinventory.save
        format.html { redirect_to @mostsmallitemequipinventory, notice: 'Mostsmallitemequipinventory was successfully created.' }
        format.json { render json: @mostsmallitemequipinventory, status: :created, location: @mostsmallitemequipinventory }
      else
        format.html { render action: "new" }
        format.json { render json: @mostsmallitemequipinventory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mostsmallitemequipinventories/1
  # PUT /mostsmallitemequipinventories/1.json
  def update
    @mostsmallitemequipinventory = Mostsmallitemequipinventory.find(params[:id])

    respond_to do |format|
      if @mostsmallitemequipinventory.update_attributes(params[:mostsmallitemequipinventory])
        format.html { redirect_to @mostsmallitemequipinventory, notice: 'Mostsmallitemequipinventory was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mostsmallitemequipinventory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mostsmallitemequipinventories/1
  # DELETE /mostsmallitemequipinventories/1.json
  def destroy
    @mostsmallitemequipinventory = Mostsmallitemequipinventory.find(params[:id])
    @mostsmallitemequipinventory.destroy

    respond_to do |format|
      format.html { redirect_to mostsmallitemequipinventories_url }
      format.json { head :no_content }
    end
  end
end
