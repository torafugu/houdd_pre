class MediumTcItemInvsController < ApplicationController
  # GET /medium_tc_item_invs
  # GET /medium_tc_item_invs.json
  def index
    @medium_tc_item_invs = MediumTcItemInv.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @medium_tc_item_invs }
    end
  end

  # GET /medium_tc_item_invs/1
  # GET /medium_tc_item_invs/1.json
  def show
    @medium_tc_item_inv = MediumTcItemInv.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @medium_tc_item_inv }
    end
  end

  # GET /medium_tc_item_invs/new
  # GET /medium_tc_item_invs/new.json
  def new
    @medium_tc_item_inv = MediumTcItemInv.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @medium_tc_item_inv }
    end
  end

  # GET /medium_tc_item_invs/1/edit
  def edit
    @medium_tc_item_inv = MediumTcItemInv.find(params[:id])
  end

  # POST /medium_tc_item_invs
  # POST /medium_tc_item_invs.json
  def create
    @medium_tc_item_inv = MediumTcItemInv.new(params[:medium_tc_item_inv])

    respond_to do |format|
      if @medium_tc_item_inv.save
        format.html { redirect_to @medium_tc_item_inv, notice: 'Medium tc item inv was successfully created.' }
        format.json { render json: @medium_tc_item_inv, status: :created, location: @medium_tc_item_inv }
      else
        format.html { render action: "new" }
        format.json { render json: @medium_tc_item_inv.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /medium_tc_item_invs/1
  # PUT /medium_tc_item_invs/1.json
  def update
    @medium_tc_item_inv = MediumTcItemInv.find(params[:id])

    respond_to do |format|
      if @medium_tc_item_inv.update_attributes(params[:medium_tc_item_inv])
        format.html { redirect_to @medium_tc_item_inv, notice: 'Medium tc item inv was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @medium_tc_item_inv.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /medium_tc_item_invs/1
  # DELETE /medium_tc_item_invs/1.json
  def destroy
    @medium_tc_item_inv = MediumTcItemInv.find(params[:id])
    @medium_tc_item_inv.destroy

    respond_to do |format|
      format.html { redirect_to medium_tc_item_invs_url }
      format.json { head :no_content }
    end
  end
end
