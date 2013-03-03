class MostsmallspeciejobinventoriesController < ApplicationController
  # GET /mostsmallspeciejobinventories
  # GET /mostsmallspeciejobinventories.json
  def index
    @mostsmallspeciejobinventories = Mostsmallspeciejobinventory.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mostsmallspeciejobinventories }
    end
  end

  # GET /mostsmallspeciejobinventories/1
  # GET /mostsmallspeciejobinventories/1.json
  def show
    @mostsmallspeciejobinventory = Mostsmallspeciejobinventory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mostsmallspeciejobinventory }
    end
  end

  # GET /mostsmallspeciejobinventories/new
  # GET /mostsmallspeciejobinventories/new.json
  def new
    @mostsmallspeciejobinventory = Mostsmallspeciejobinventory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mostsmallspeciejobinventory }
    end
  end

  # GET /mostsmallspeciejobinventories/1/edit
  def edit
    @mostsmallspeciejobinventory = Mostsmallspeciejobinventory.find(params[:id])
  end

  # POST /mostsmallspeciejobinventories
  # POST /mostsmallspeciejobinventories.json
  def create
    @mostsmallspeciejobinventory = Mostsmallspeciejobinventory.new(params[:mostsmallspeciejobinventory])

    respond_to do |format|
      if @mostsmallspeciejobinventory.save
        format.html { redirect_to @mostsmallspeciejobinventory, notice: 'Mostsmallspeciejobinventory was successfully created.' }
        format.json { render json: @mostsmallspeciejobinventory, status: :created, location: @mostsmallspeciejobinventory }
      else
        format.html { render action: "new" }
        format.json { render json: @mostsmallspeciejobinventory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mostsmallspeciejobinventories/1
  # PUT /mostsmallspeciejobinventories/1.json
  def update
    @mostsmallspeciejobinventory = Mostsmallspeciejobinventory.find(params[:id])

    respond_to do |format|
      if @mostsmallspeciejobinventory.update_attributes(params[:mostsmallspeciejobinventory])
        format.html { redirect_to @mostsmallspeciejobinventory, notice: 'Mostsmallspeciejobinventory was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mostsmallspeciejobinventory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mostsmallspeciejobinventories/1
  # DELETE /mostsmallspeciejobinventories/1.json
  def destroy
    @mostsmallspeciejobinventory = Mostsmallspeciejobinventory.find(params[:id])
    @mostsmallspeciejobinventory.destroy

    respond_to do |format|
      format.html { redirect_to mostsmallspeciejobinventories_url }
      format.json { head :no_content }
    end
  end
end
