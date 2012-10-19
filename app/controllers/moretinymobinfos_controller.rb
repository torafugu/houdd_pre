class MoretinymobinfosController < ApplicationController
  # GET /moretinymobinfos
  # GET /moretinymobinfos.json
  def index
    @moretinymobinfos = Moretinymobinfo.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @moretinymobinfos }
    end
  end

  # GET /moretinymobinfos/1
  # GET /moretinymobinfos/1.json
  def show
    @moretinymobinfo = Moretinymobinfo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @moretinymobinfo }
    end
  end

  # GET /moretinymobinfos/new
  # GET /moretinymobinfos/new.json
  def new
    @moretinymobinfo = Moretinymobinfo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @moretinymobinfo }
    end
  end

  # GET /moretinymobinfos/1/edit
  def edit
    @moretinymobinfo = Moretinymobinfo.find(params[:id])
  end

  # POST /moretinymobinfos
  # POST /moretinymobinfos.json
  def create
    @moretinymobinfo = Moretinymobinfo.new(params[:moretinymobinfo])

    respond_to do |format|
      if @moretinymobinfo.save
        format.html { redirect_to @moretinymobinfo, notice: 'Moretinymobinfo was successfully created.' }
        format.json { render json: @moretinymobinfo, status: :created, location: @moretinymobinfo }
      else
        format.html { render action: "new" }
        format.json { render json: @moretinymobinfo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /moretinymobinfos/1
  # PUT /moretinymobinfos/1.json
  def update
    @moretinymobinfo = Moretinymobinfo.find(params[:id])

    respond_to do |format|
      if @moretinymobinfo.update_attributes(params[:moretinymobinfo])
        format.html { redirect_to @moretinymobinfo, notice: 'Moretinymobinfo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @moretinymobinfo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /moretinymobinfos/1
  # DELETE /moretinymobinfos/1.json
  def destroy
    @moretinymobinfo = Moretinymobinfo.find(params[:id])
    @moretinymobinfo.destroy

    respond_to do |format|
      format.html { redirect_to moretinymobinfos_url }
      format.json { head :no_content }
    end
  end
end
