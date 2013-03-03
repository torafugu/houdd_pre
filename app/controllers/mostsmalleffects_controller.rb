class MostsmalleffectsController < ApplicationController
  # GET /mostsmalleffects
  # GET /mostsmalleffects.json
  def index
    @mostsmalleffects = Mostsmalleffect.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mostsmalleffects }
    end
  end

  # GET /mostsmalleffects/1
  # GET /mostsmalleffects/1.json
  def show
    @mostsmalleffect = Mostsmalleffect.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mostsmalleffect }
    end
  end

  # GET /mostsmalleffects/new
  # GET /mostsmalleffects/new.json
  def new
    @mostsmalleffect = Mostsmalleffect.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mostsmalleffect }
    end
  end

  # GET /mostsmalleffects/1/edit
  def edit
    @mostsmalleffect = Mostsmalleffect.find(params[:id])
  end

  # POST /mostsmalleffects
  # POST /mostsmalleffects.json
  def create
    @mostsmalleffect = Mostsmalleffect.new(params[:mostsmalleffect])

    respond_to do |format|
      if @mostsmalleffect.save
        format.html { redirect_to @mostsmalleffect, notice: 'Mostsmalleffect was successfully created.' }
        format.json { render json: @mostsmalleffect, status: :created, location: @mostsmalleffect }
      else
        format.html { render action: "new" }
        format.json { render json: @mostsmalleffect.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mostsmalleffects/1
  # PUT /mostsmalleffects/1.json
  def update
    @mostsmalleffect = Mostsmalleffect.find(params[:id])

    respond_to do |format|
      if @mostsmalleffect.update_attributes(params[:mostsmalleffect])
        format.html { redirect_to @mostsmalleffect, notice: 'Mostsmalleffect was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mostsmalleffect.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mostsmalleffects/1
  # DELETE /mostsmalleffects/1.json
  def destroy
    @mostsmalleffect = Mostsmalleffect.find(params[:id])
    @mostsmalleffect.destroy

    respond_to do |format|
      format.html { redirect_to mostsmalleffects_url }
      format.json { head :no_content }
    end
  end
end
