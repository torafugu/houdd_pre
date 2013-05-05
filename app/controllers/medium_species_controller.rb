class MediumSpeciesController < ApplicationController
  # GET /medium_species
  # GET /medium_species.json
  def index
    @medium_species = MediumSpecie.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @medium_species }
    end
  end

  # GET /medium_species/1
  # GET /medium_species/1.json
  def show
    @medium_specie = MediumSpecie.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @medium_specie }
    end
  end

  # GET /medium_species/new
  # GET /medium_species/new.json
  def new
    @medium_specie = MediumSpecie.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @medium_specie }
    end
  end

  # GET /medium_species/1/edit
  def edit
    @medium_specie = MediumSpecie.find(params[:id])
  end

  # POST /medium_species
  # POST /medium_species.json
  def create
    @medium_specie = MediumSpecie.new(params[:medium_specie])

    respond_to do |format|
      if @medium_specie.save
        format.html { redirect_to @medium_specie, notice: 'Medium specie was successfully created.' }
        format.json { render json: @medium_specie, status: :created, location: @medium_specie }
      else
        format.html { render action: "new" }
        format.json { render json: @medium_specie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /medium_species/1
  # PUT /medium_species/1.json
  def update
    @medium_specie = MediumSpecie.find(params[:id])

    respond_to do |format|
      if @medium_specie.update_attributes(params[:medium_specie])
        format.html { redirect_to @medium_specie, notice: 'Medium specie was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @medium_specie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /medium_species/1
  # DELETE /medium_species/1.json
  def destroy
    @medium_specie = MediumSpecie.find(params[:id])
    @medium_specie.destroy

    respond_to do |format|
      format.html { redirect_to medium_species_url }
      format.json { head :no_content }
    end
  end
end
