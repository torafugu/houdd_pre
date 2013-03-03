class MostsmallskilleffectinventoriesController < ApplicationController
  # GET /mostsmallskilleffectinventories
  # GET /mostsmallskilleffectinventories.json
  def index
    @mostsmallskilleffectinventories = Mostsmallskilleffectinventory.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mostsmallskilleffectinventories }
    end
  end

  # GET /mostsmallskilleffectinventories/1
  # GET /mostsmallskilleffectinventories/1.json
  def show
    @mostsmallskilleffectinventory = Mostsmallskilleffectinventory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mostsmallskilleffectinventory }
    end
  end

  # GET /mostsmallskilleffectinventories/new
  # GET /mostsmallskilleffectinventories/new.json
  def new
    @mostsmallskilleffectinventory = Mostsmallskilleffectinventory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mostsmallskilleffectinventory }
    end
  end

  # GET /mostsmallskilleffectinventories/1/edit
  def edit
    @mostsmallskilleffectinventory = Mostsmallskilleffectinventory.find(params[:id])
  end

  # POST /mostsmallskilleffectinventories
  # POST /mostsmallskilleffectinventories.json
  def create
    @mostsmallskilleffectinventory = Mostsmallskilleffectinventory.new(params[:mostsmallskilleffectinventory])

    respond_to do |format|
      if @mostsmallskilleffectinventory.save
        format.html { redirect_to @mostsmallskilleffectinventory, notice: 'Mostsmallskilleffectinventory was successfully created.' }
        format.json { render json: @mostsmallskilleffectinventory, status: :created, location: @mostsmallskilleffectinventory }
      else
        format.html { render action: "new" }
        format.json { render json: @mostsmallskilleffectinventory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mostsmallskilleffectinventories/1
  # PUT /mostsmallskilleffectinventories/1.json
  def update
    @mostsmallskilleffectinventory = Mostsmallskilleffectinventory.find(params[:id])

    respond_to do |format|
      if @mostsmallskilleffectinventory.update_attributes(params[:mostsmallskilleffectinventory])
        format.html { redirect_to @mostsmallskilleffectinventory, notice: 'Mostsmallskilleffectinventory was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mostsmallskilleffectinventory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mostsmallskilleffectinventories/1
  # DELETE /mostsmallskilleffectinventories/1.json
  def destroy
    @mostsmallskilleffectinventory = Mostsmallskilleffectinventory.find(params[:id])
    @mostsmallskilleffectinventory.destroy

    respond_to do |format|
      format.html { redirect_to mostsmallskilleffectinventories_url }
      format.json { head :no_content }
    end
  end
end
