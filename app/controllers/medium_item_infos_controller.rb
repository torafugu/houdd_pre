class MediumItemInfosController < ApplicationController
  # GET /medium_item_infos
  # GET /medium_item_infos.json
  def index
    @medium_item_infos = MediumItemInfo.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @medium_item_infos }
    end
  end

  # GET /medium_item_infos/1
  # GET /medium_item_infos/1.json
  def show
    @medium_item_info = MediumItemInfo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @medium_item_info }
    end
  end

  # GET /medium_item_infos/new
  # GET /medium_item_infos/new.json
  def new
    @medium_item_info = MediumItemInfo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @medium_item_info }
    end
  end

  # GET /medium_item_infos/1/edit
  def edit
    @medium_item_info = MediumItemInfo.find(params[:id])
  end

  # POST /medium_item_infos
  # POST /medium_item_infos.json
  def create
    @medium_item_info = MediumItemInfo.new(params[:medium_item_info])

    respond_to do |format|
      if @medium_item_info.save
        format.html { redirect_to @medium_item_info, notice: 'Medium item info was successfully created.' }
        format.json { render json: @medium_item_info, status: :created, location: @medium_item_info }
      else
        format.html { render action: "new" }
        format.json { render json: @medium_item_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /medium_item_infos/1
  # PUT /medium_item_infos/1.json
  def update
    @medium_item_info = MediumItemInfo.find(params[:id])

    respond_to do |format|
      if @medium_item_info.update_attributes(params[:medium_item_info])
        format.html { redirect_to @medium_item_info, notice: 'Medium item info was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @medium_item_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /medium_item_infos/1
  # DELETE /medium_item_infos/1.json
  def destroy
    @medium_item_info = MediumItemInfo.find(params[:id])
    @medium_item_info.destroy

    respond_to do |format|
      format.html { redirect_to medium_item_infos_url }
      format.json { head :no_content }
    end
  end
end
