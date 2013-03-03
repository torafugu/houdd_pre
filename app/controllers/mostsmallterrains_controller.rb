class MostsmallterrainsController < ApplicationController
  # GET /mostsmallterrains
  # GET /mostsmallterrains.json
  def index
    @mostsmallterrains = Mostsmallterrain.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mostsmallterrains }
    end
  end

  # GET /mostsmallterrains/1
  # GET /mostsmallterrains/1.json
  def show
    @mostsmallterrain = Mostsmallterrain.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mostsmallterrain }
    end
  end

  # GET /mostsmallterrains/new
  # GET /mostsmallterrains/new.json
  def new
    @mostsmallterrain = Mostsmallterrain.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mostsmallterrain }
    end
  end

  # GET /mostsmallterrains/1/edit
  def edit
    @mostsmallterrain = Mostsmallterrain.find(params[:id])
  end

  # POST /mostsmallterrains
  # POST /mostsmallterrains.json
  def create
    @mostsmallterrain = Mostsmallterrain.new(params[:mostsmallterrain])

    respond_to do |format|
      if @mostsmallterrain.save
        format.html { redirect_to @mostsmallterrain, notice: 'Mostsmallterrain was successfully created.' }
        format.json { render json: @mostsmallterrain, status: :created, location: @mostsmallterrain }
      else
        format.html { render action: "new" }
        format.json { render json: @mostsmallterrain.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mostsmallterrains/1
  # PUT /mostsmallterrains/1.json
  def update
    @mostsmallterrain = Mostsmallterrain.find(params[:id])

    respond_to do |format|
      if @mostsmallterrain.update_attributes(params[:mostsmallterrain])
        format.html { redirect_to @mostsmallterrain, notice: 'Mostsmallterrain was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mostsmallterrain.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mostsmallterrains/1
  # DELETE /mostsmallterrains/1.json
  def destroy
    @mostsmallterrain = Mostsmallterrain.find(params[:id])
    @mostsmallterrain.destroy

    respond_to do |format|
      format.html { redirect_to mostsmallterrains_url }
      format.json { head :no_content }
    end
  end
end
