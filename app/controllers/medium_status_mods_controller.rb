class MediumStatusModsController < ApplicationController
  # GET /medium_status_mods
  # GET /medium_status_mods.json
  def index
    @medium_status_mods = MediumStatusMod.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @medium_status_mods }
    end
  end

  # GET /medium_status_mods/1
  # GET /medium_status_mods/1.json
  def show
    @medium_status_mod = MediumStatusMod.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @medium_status_mod }
    end
  end

  # GET /medium_status_mods/new
  # GET /medium_status_mods/new.json
  def new
    @medium_status_mod = MediumStatusMod.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @medium_status_mod }
    end
  end

  # GET /medium_status_mods/1/edit
  def edit
    @medium_status_mod = MediumStatusMod.find(params[:id])
  end

  # POST /medium_status_mods
  # POST /medium_status_mods.json
  def create
    @medium_status_mod = MediumStatusMod.new(params[:medium_status_mod])

    respond_to do |format|
      if @medium_status_mod.save
        format.html { redirect_to @medium_status_mod, notice: 'Medium status mod was successfully created.' }
        format.json { render json: @medium_status_mod, status: :created, location: @medium_status_mod }
      else
        format.html { render action: "new" }
        format.json { render json: @medium_status_mod.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /medium_status_mods/1
  # PUT /medium_status_mods/1.json
  def update
    @medium_status_mod = MediumStatusMod.find(params[:id])

    respond_to do |format|
      if @medium_status_mod.update_attributes(params[:medium_status_mod])
        format.html { redirect_to @medium_status_mod, notice: 'Medium status mod was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @medium_status_mod.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /medium_status_mods/1
  # DELETE /medium_status_mods/1.json
  def destroy
    @medium_status_mod = MediumStatusMod.find(params[:id])
    @medium_status_mod.destroy

    respond_to do |format|
      format.html { redirect_to medium_status_mods_url }
      format.json { head :no_content }
    end
  end
end
