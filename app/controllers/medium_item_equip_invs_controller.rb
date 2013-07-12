class MediumItemEquipInvsController < ApplicationController
  # GET /medium_item_equip_invs
  # GET /medium_item_equip_invs.json
  def index
    @medium_item_equip_invs = MediumItemEquipInv.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @medium_item_equip_invs }
    end
  end

  # GET /medium_item_equip_invs/1
  # GET /medium_item_equip_invs/1.json
  def show
    @medium_item_equip_inv = MediumItemEquipInv.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @medium_item_equip_inv }
    end
  end

  # GET /medium_item_equip_invs/new
  # GET /medium_item_equip_invs/new.json
  def new
    @medium_item_equip_inv = MediumItemEquipInv.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @medium_item_equip_inv }
    end
  end

  # GET /medium_item_equip_invs/1/edit
  def edit
    @medium_item_equip_inv = MediumItemEquipInv.find(params[:id])
  end

  # POST /medium_item_equip_invs
  # POST /medium_item_equip_invs.json
  def create
    @medium_item_equip_inv = MediumItemEquipInv.new(params[:medium_item_equip_inv])

    respond_to do |format|
      if @medium_item_equip_inv.save
        format.html { redirect_to @medium_item_equip_inv, notice: 'Medium item equip inv was successfully created.' }
        format.json { render json: @medium_item_equip_inv, status: :created, location: @medium_item_equip_inv }
      else
        format.html { render action: "new" }
        format.json { render json: @medium_item_equip_inv.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /medium_item_equip_invs/1
  # PUT /medium_item_equip_invs/1.json
  def update
    @medium_item_equip_inv = MediumItemEquipInv.find(params[:id])

    respond_to do |format|
      if @medium_item_equip_inv.update_attributes(params[:medium_item_equip_inv])
        format.html { redirect_to @medium_item_equip_inv, notice: 'Medium item equip inv was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @medium_item_equip_inv.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /medium_item_equip_invs/1
  # DELETE /medium_item_equip_invs/1.json
  def destroy
    @medium_item_equip_inv = MediumItemEquipInv.find(params[:id])
    @medium_item_equip_inv.destroy

    respond_to do |format|
      format.html { redirect_to medium_item_equip_invs_url }
      format.json { head :no_content }
    end
  end

  # GET /medium_item_equip_invs/select_items
  # GET /medium_item_equip_invs/1/select_items
  def select_items
    item_list = MediumItem.find_all_by_medium_houdd_user_id(params[:user_id])
    @items = item_list.collect{|m| [m.medium_item_info.name, m.id]}
    @mobs = MediumMob.find_all_by_medium_houdd_user_id(params[:user_id]).collect{|m| [m.name, m.id]}
    unless @items.blank?
      body_part = MediumBodyPart.find(item_list.first.medium_item_info.medium_body_part_id)
      @body_parts = [[body_part.name, body_part.id]]
    else
      @body_parts = nil
    end
    render
  end

  # GET /medium_item_equip_invs/select_body_parts
  # GET /medium_item_equip_invs/1/select_body_parts
  def select_body_parts
    item = MediumItem.find(params[:item_id])
    body_part = MediumBodyPart.find(item.medium_item_info.medium_body_part_id)
    @body_parts = [[body_part.name, body_part.id]]
    render
  end
end
