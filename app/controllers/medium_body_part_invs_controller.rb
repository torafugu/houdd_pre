class MediumBodyPartInvsController < ApplicationController
  # GET /medium_body_part_invs
  # GET /medium_body_part_invs.json
  def index
    @medium_body_part_invs = MediumBodyPartInv.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @medium_body_part_invs }
    end
  end

  # GET /medium_body_part_invs/1
  # GET /medium_body_part_invs/1.json
  def show
    @medium_body_part_inv = MediumBodyPartInv.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @medium_body_part_inv }
    end
  end

  # GET /medium_body_part_invs/new
  # GET /medium_body_part_invs/new.json
  def new
    @medium_body_part_inv = MediumBodyPartInv.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @medium_body_part_inv }
    end
  end

  # GET /medium_body_part_invs/1/edit
  def edit
    @medium_body_part_inv = MediumBodyPartInv.find(params[:id])
  end

  # POST /medium_body_part_invs
  # POST /medium_body_part_invs.json
  def create
    @medium_body_part_inv = MediumBodyPartInv.new(params[:medium_body_part_inv])

    respond_to do |format|
      if @medium_body_part_inv.save
        format.html { redirect_to @medium_body_part_inv, notice: 'Medium body part inv was successfully created.' }
        format.json { render json: @medium_body_part_inv, status: :created, location: @medium_body_part_inv }
      else
        format.html { render action: "new" }
        format.json { render json: @medium_body_part_inv.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /medium_body_part_invs/1
  # PUT /medium_body_part_invs/1.json
  def update
    @medium_body_part_inv = MediumBodyPartInv.find(params[:id])

    respond_to do |format|
      if @medium_body_part_inv.update_attributes(params[:medium_body_part_inv])
        format.html { redirect_to @medium_body_part_inv, notice: 'Medium body part inv was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @medium_body_part_inv.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /medium_body_part_invs/1
  # DELETE /medium_body_part_invs/1.json
  def destroy
    @medium_body_part_inv = MediumBodyPartInv.find(params[:id])
    @medium_body_part_inv.destroy

    respond_to do |format|
      format.html { redirect_to medium_body_part_invs_url }
      format.json { head :no_content }
    end
  end
end
