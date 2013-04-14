class MostsmallmissioninventoriesController < ApplicationController
  # GET /mostsmallmissioninventories
  # GET /mostsmallmissioninventories.json
  def index
    @mostsmallmissioninventories = Mostsmallmissioninventory.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mostsmallmissioninventories }
    end
  end

  # GET /mostsmallmissioninventories/1
  # GET /mostsmallmissioninventories/1.json
  def show
    @mostsmallmissioninventory = Mostsmallmissioninventory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mostsmallmissioninventory }
    end
  end

  # GET /mostsmallmissioninventories/new
  # GET /mostsmallmissioninventories/new.json
  def new
    @mostsmallmissioninventory = Mostsmallmissioninventory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mostsmallmissioninventory }
    end
  end

  # GET /mostsmallmissioninventories/1/edit
  def edit
    @mostsmallmissioninventory = Mostsmallmissioninventory.find(params[:id])
  end

  # POST /mostsmallmissioninventories
  # POST /mostsmallmissioninventories.json
  def create
    @mostsmallmissioninventory = Mostsmallmissioninventory.new(params[:mostsmallmissioninventory])

    respond_to do |format|
      if @mostsmallmissioninventory.save
        format.html { redirect_to @mostsmallmissioninventory, notice: 'Mostsmallmissioninventory was successfully created.' }
        format.json { render json: @mostsmallmissioninventory, status: :created, location: @mostsmallmissioninventory }
      else
        format.html { render action: "new" }
        format.json { render json: @mostsmallmissioninventory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mostsmallmissioninventories/1
  # PUT /mostsmallmissioninventories/1.json
  def update
    @mostsmallmissioninventory = Mostsmallmissioninventory.find(params[:id])

    respond_to do |format|
      if @mostsmallmissioninventory.update_attributes(params[:mostsmallmissioninventory])
        format.html { redirect_to @mostsmallmissioninventory, notice: 'Mostsmallmissioninventory was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mostsmallmissioninventory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mostsmallmissioninventories/1
  # DELETE /mostsmallmissioninventories/1.json
  def destroy
    @mostsmallmissioninventory = Mostsmallmissioninventory.find(params[:id])
    @mostsmallmissioninventory.destroy

    respond_to do |format|
      format.html { redirect_to mostsmallmissioninventories_url }
      format.json { head :no_content }
    end
  end
end
