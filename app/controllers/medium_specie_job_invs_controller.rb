class MediumSpecieJobInvsController < ApplicationController
  # GET /medium_specie_job_invs
  # GET /medium_specie_job_invs.json
  def index
    @medium_specie_job_invs = MediumSpecieJobInv.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @medium_specie_job_invs }
    end
  end

  # GET /medium_specie_job_invs/1
  # GET /medium_specie_job_invs/1.json
  def show
    @medium_specie_job_inv = MediumSpecieJobInv.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @medium_specie_job_inv }
    end
  end

  # GET /medium_specie_job_invs/new
  # GET /medium_specie_job_invs/new.json
  def new
    @medium_specie_job_inv = MediumSpecieJobInv.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @medium_specie_job_inv }
    end
  end

  # GET /medium_specie_job_invs/1/edit
  def edit
    @medium_specie_job_inv = MediumSpecieJobInv.find(params[:id])
  end

  # POST /medium_specie_job_invs
  # POST /medium_specie_job_invs.json
  def create
    @medium_specie_job_inv = MediumSpecieJobInv.new(params[:medium_specie_job_inv])

    respond_to do |format|
      if @medium_specie_job_inv.save
        format.html { redirect_to @medium_specie_job_inv, notice: 'Medium specie job inv was successfully created.' }
        format.json { render json: @medium_specie_job_inv, status: :created, location: @medium_specie_job_inv }
      else
        format.html { render action: "new" }
        format.json { render json: @medium_specie_job_inv.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /medium_specie_job_invs/1
  # PUT /medium_specie_job_invs/1.json
  def update
    @medium_specie_job_inv = MediumSpecieJobInv.find(params[:id])

    respond_to do |format|
      if @medium_specie_job_inv.update_attributes(params[:medium_specie_job_inv])
        format.html { redirect_to @medium_specie_job_inv, notice: 'Medium specie job inv was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @medium_specie_job_inv.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /medium_specie_job_invs/1
  # DELETE /medium_specie_job_invs/1.json
  def destroy
    @medium_specie_job_inv = MediumSpecieJobInv.find(params[:id])
    @medium_specie_job_inv.destroy

    respond_to do |format|
      format.html { redirect_to medium_specie_job_invs_url }
      format.json { head :no_content }
    end
  end
end
