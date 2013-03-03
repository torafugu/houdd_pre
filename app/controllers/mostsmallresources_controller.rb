class MostsmallresourcesController < ApplicationController
  # GET /mostsmallresources
  # GET /mostsmallresources.json
  def index
    @mostsmallresources = Mostsmallresource.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mostsmallresources }
    end
  end

  # GET /mostsmallresources/1
  # GET /mostsmallresources/1.json
  def show
    @mostsmallresource = Mostsmallresource.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mostsmallresource }
    end
  end

  # GET /mostsmallresources/new
  # GET /mostsmallresources/new.json
  def new
    @mostsmallresource = Mostsmallresource.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mostsmallresource }
    end
  end

  # GET /mostsmallresources/1/edit
  def edit
    @mostsmallresource = Mostsmallresource.find(params[:id])
  end

  # POST /mostsmallresources
  # POST /mostsmallresources.json
  def create
    @mostsmallresource = Mostsmallresource.new(params[:mostsmallresource])

    respond_to do |format|
      if @mostsmallresource.save
        format.html { redirect_to @mostsmallresource, notice: 'Mostsmallresource was successfully created.' }
        format.json { render json: @mostsmallresource, status: :created, location: @mostsmallresource }
      else
        format.html { render action: "new" }
        format.json { render json: @mostsmallresource.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mostsmallresources/1
  # PUT /mostsmallresources/1.json
  def update
    @mostsmallresource = Mostsmallresource.find(params[:id])

    respond_to do |format|
      if @mostsmallresource.update_attributes(params[:mostsmallresource])
        format.html { redirect_to @mostsmallresource, notice: 'Mostsmallresource was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mostsmallresource.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mostsmallresources/1
  # DELETE /mostsmallresources/1.json
  def destroy
    @mostsmallresource = Mostsmallresource.find(params[:id])
    @mostsmallresource.destroy

    respond_to do |format|
      format.html { redirect_to mostsmallresources_url }
      format.json { head :no_content }
    end
  end
end
