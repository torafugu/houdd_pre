class MediumAtkInfosController < ApplicationController
  # GET /medium_atk_infos
  # GET /medium_atk_infos.json
  def index
    @medium_atk_infos = MediumAtkInfo.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @medium_atk_infos }
    end
  end

  # GET /medium_atk_infos/1
  # GET /medium_atk_infos/1.json
  def show
    @medium_atk_info = MediumAtkInfo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @medium_atk_info }
    end
  end

  # GET /medium_atk_infos/new
  # GET /medium_atk_infos/new.json
  def new
    @medium_atk_info = MediumAtkInfo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @medium_atk_info }
    end
  end

  # GET /medium_atk_infos/1/edit
  def edit
    @medium_atk_info = MediumAtkInfo.find(params[:id])
  end

  # POST /medium_atk_infos
  # POST /medium_atk_infos.json
  def create
    @medium_atk_info = MediumAtkInfo.new(params[:medium_atk_info])

    respond_to do |format|
      if @medium_atk_info.save
        format.html { redirect_to @medium_atk_info, notice: 'Medium atk info was successfully created.' }
        format.json { render json: @medium_atk_info, status: :created, location: @medium_atk_info }
      else
        format.html { render action: "new" }
        format.json { render json: @medium_atk_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /medium_atk_infos/1
  # PUT /medium_atk_infos/1.json
  def update
    @medium_atk_info = MediumAtkInfo.find(params[:id])

    respond_to do |format|
      if @medium_atk_info.update_attributes(params[:medium_atk_info])
        format.html { redirect_to @medium_atk_info, notice: 'Medium atk info was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @medium_atk_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /medium_atk_infos/1
  # DELETE /medium_atk_infos/1.json
  def destroy
    @medium_atk_info = MediumAtkInfo.find(params[:id])
    @medium_atk_info.destroy

    respond_to do |format|
      format.html { redirect_to medium_atk_infos_url }
      format.json { head :no_content }
    end
  end
end
