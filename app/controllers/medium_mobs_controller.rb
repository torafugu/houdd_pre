class MediumMobsController < ApplicationController
  # GET /medium_mobs
  # GET /medium_mobs.json
  def index
    @medium_mobs = MediumMob.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @medium_mobs }
    end
  end

  # GET /medium_mobs/1
  # GET /medium_mobs/1.json
  def show
    @medium_mob = MediumMob.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @medium_mob }
    end
  end

  # GET /medium_mobs/new
  # GET /medium_mobs/new.json
  def new
    @medium_mob = MediumMob.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @medium_mob }
    end
  end

  # GET /medium_mobs/1/edit
  def edit
    @medium_mob = MediumMob.find(params[:id])
  end

  # POST /medium_mobs
  # POST /medium_mobs.json
  def create
    @medium_mob = MediumMob.new(params[:medium_mob])

    respond_to do |format|
      if @medium_mob.save
        format.html { redirect_to @medium_mob, notice: 'Medium mob was successfully created.' }
        format.json { render json: @medium_mob, status: :created, location: @medium_mob }
      else
        format.html { render action: "new" }
        format.json { render json: @medium_mob.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /medium_mobs/1
  # PUT /medium_mobs/1.json
  def update
    @medium_mob = MediumMob.find(params[:id])

    respond_to do |format|
      if @medium_mob.update_attributes(params[:medium_mob])
        format.html { redirect_to @medium_mob, notice: 'Medium mob was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @medium_mob.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /medium_mobs/1
  # DELETE /medium_mobs/1.json
  def destroy
    @medium_mob = MediumMob.find(params[:id])
    @medium_mob.destroy

    respond_to do |format|
      format.html { redirect_to medium_mobs_url }
      format.json { head :no_content }
    end
  end
end
