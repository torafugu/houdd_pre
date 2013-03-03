class MostsmallitemeffectinventoriesController < ApplicationController
  # GET /mostsmallitemeffectinventories
  # GET /mostsmallitemeffectinventories.json
  def index
    @mostsmallitemeffectinventories = Mostsmallitemeffectinventory.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mostsmallitemeffectinventories }
    end
  end

  # GET /mostsmallitemeffectinventories/1
  # GET /mostsmallitemeffectinventories/1.json
  def show
    @mostsmallitemeffectinventory = Mostsmallitemeffectinventory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mostsmallitemeffectinventory }
    end
  end

  # GET /mostsmallitemeffectinventories/new
  # GET /mostsmallitemeffectinventories/new.json
  def new
    @mostsmallitemeffectinventory = Mostsmallitemeffectinventory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mostsmallitemeffectinventory }
    end
  end

  # GET /mostsmallitemeffectinventories/1/edit
  def edit
    @mostsmallitemeffectinventory = Mostsmallitemeffectinventory.find(params[:id])
  end

  # POST /mostsmallitemeffectinventories
  # POST /mostsmallitemeffectinventories.json
  def create
    @mostsmallitemeffectinventory = Mostsmallitemeffectinventory.new(params[:mostsmallitemeffectinventory])

    respond_to do |format|
      if @mostsmallitemeffectinventory.save
        format.html { redirect_to @mostsmallitemeffectinventory, notice: 'Mostsmallitemeffectinventory was successfully created.' }
        format.json { render json: @mostsmallitemeffectinventory, status: :created, location: @mostsmallitemeffectinventory }
      else
        format.html { render action: "new" }
        format.json { render json: @mostsmallitemeffectinventory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mostsmallitemeffectinventories/1
  # PUT /mostsmallitemeffectinventories/1.json
  def update
    @mostsmallitemeffectinventory = Mostsmallitemeffectinventory.find(params[:id])

    respond_to do |format|
      if @mostsmallitemeffectinventory.update_attributes(params[:mostsmallitemeffectinventory])
        format.html { redirect_to @mostsmallitemeffectinventory, notice: 'Mostsmallitemeffectinventory was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mostsmallitemeffectinventory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mostsmallitemeffectinventories/1
  # DELETE /mostsmallitemeffectinventories/1.json
  def destroy
    @mostsmallitemeffectinventory = Mostsmallitemeffectinventory.find(params[:id])
    @mostsmallitemeffectinventory.destroy

    respond_to do |format|
      format.html { redirect_to mostsmallitemeffectinventories_url }
      format.json { head :no_content }
    end
  end
end
