class MediumConstNecResInvsController < ApplicationController
  # GET /medium_const_nec_res_invs
  # GET /medium_const_nec_res_invs.json
  def index
    @medium_const_nec_res_invs = MediumConstNecResInv.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @medium_const_nec_res_invs }
    end
  end

  # GET /medium_const_nec_res_invs/1
  # GET /medium_const_nec_res_invs/1.json
  def show
    @medium_const_nec_res_inv = MediumConstNecResInv.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @medium_const_nec_res_inv }
    end
  end

  # GET /medium_const_nec_res_invs/new
  # GET /medium_const_nec_res_invs/new.json
  def new
    @medium_const_nec_res_inv = MediumConstNecResInv.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @medium_const_nec_res_inv }
    end
  end

  # GET /medium_const_nec_res_invs/1/edit
  def edit
    @medium_const_nec_res_inv = MediumConstNecResInv.find(params[:id])
  end

  # POST /medium_const_nec_res_invs
  # POST /medium_const_nec_res_invs.json
  def create
    @medium_const_nec_res_inv = MediumConstNecResInv.new(params[:medium_const_nec_res_inv])

    respond_to do |format|
      if @medium_const_nec_res_inv.save
        format.html { redirect_to @medium_const_nec_res_inv, notice: 'Medium const nec res inv was successfully created.' }
        format.json { render json: @medium_const_nec_res_inv, status: :created, location: @medium_const_nec_res_inv }
      else
        format.html { render action: "new" }
        format.json { render json: @medium_const_nec_res_inv.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /medium_const_nec_res_invs/1
  # PUT /medium_const_nec_res_invs/1.json
  def update
    @medium_const_nec_res_inv = MediumConstNecResInv.find(params[:id])

    respond_to do |format|
      if @medium_const_nec_res_inv.update_attributes(params[:medium_const_nec_res_inv])
        format.html { redirect_to @medium_const_nec_res_inv, notice: 'Medium const nec res inv was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @medium_const_nec_res_inv.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /medium_const_nec_res_invs/1
  # DELETE /medium_const_nec_res_invs/1.json
  def destroy
    @medium_const_nec_res_inv = MediumConstNecResInv.find(params[:id])
    @medium_const_nec_res_inv.destroy

    respond_to do |format|
      format.html { redirect_to medium_const_nec_res_invs_url }
      format.json { head :no_content }
    end
  end
end
