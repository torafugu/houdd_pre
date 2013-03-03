class MostsmallresearchesController < ApplicationController
  # GET /mostsmallresearches
  # GET /mostsmallresearches.json
  def index
    @mostsmallresearches = Mostsmallresearch.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mostsmallresearches }
    end
  end

  # GET /mostsmallresearches/1
  # GET /mostsmallresearches/1.json
  def show
    @mostsmallresearch = Mostsmallresearch.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mostsmallresearch }
    end
  end

  # GET /mostsmallresearches/new
  # GET /mostsmallresearches/new.json
  def new
    @mostsmallresearch = Mostsmallresearch.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mostsmallresearch }
    end
  end

  # GET /mostsmallresearches/1/edit
  def edit
    @mostsmallresearch = Mostsmallresearch.find(params[:id])
  end

  # POST /mostsmallresearches
  # POST /mostsmallresearches.json
  def create
    @mostsmallresearch = Mostsmallresearch.new(params[:mostsmallresearch])

    respond_to do |format|
      if @mostsmallresearch.save
        format.html { redirect_to @mostsmallresearch, notice: 'Mostsmallresearch was successfully created.' }
        format.json { render json: @mostsmallresearch, status: :created, location: @mostsmallresearch }
      else
        format.html { render action: "new" }
        format.json { render json: @mostsmallresearch.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mostsmallresearches/1
  # PUT /mostsmallresearches/1.json
  def update
    @mostsmallresearch = Mostsmallresearch.find(params[:id])

    respond_to do |format|
      if @mostsmallresearch.update_attributes(params[:mostsmallresearch])
        format.html { redirect_to @mostsmallresearch, notice: 'Mostsmallresearch was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mostsmallresearch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mostsmallresearches/1
  # DELETE /mostsmallresearches/1.json
  def destroy
    @mostsmallresearch = Mostsmallresearch.find(params[:id])
    @mostsmallresearch.destroy

    respond_to do |format|
      format.html { redirect_to mostsmallresearches_url }
      format.json { head :no_content }
    end
  end
end
