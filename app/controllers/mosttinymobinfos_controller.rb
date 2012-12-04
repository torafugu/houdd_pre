class MosttinymobinfosController < ApplicationController
  # GET /mosttinymobinfos
  # GET /mosttinymobinfos.json
  def index
    @mosttinymobinfos = Mosttinymobinfo.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mosttinymobinfos }
    end
  end

  # GET /mosttinymobinfos/1
  # GET /mosttinymobinfos/1.json
  def show
    @mosttinymobinfo = Mosttinymobinfo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mosttinymobinfo }
    end
  end

  # GET /mosttinymobinfos/new
  # GET /mosttinymobinfos/new.json
  def new
    @mosttinymobinfo = Mosttinymobinfo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mosttinymobinfo }
    end
  end

  # GET /mosttinymobinfos/1/edit
  def edit
    @mosttinymobinfo = Mosttinymobinfo.find(params[:id])
  end

  # POST /mosttinymobinfos
  # POST /mosttinymobinfos.json
  def create
    @mosttinymobinfo = Mosttinymobinfo.new(params[:mosttinymobinfo])

    respond_to do |format|
      if @mosttinymobinfo.save
        format.html { redirect_to @mosttinymobinfo, notice: 'Mosttinymobinfo was successfully created.' }
        format.json { render json: @mosttinymobinfo, status: :created, location: @mosttinymobinfo }
      else
        format.html { render action: "new" }
        format.json { render json: @mosttinymobinfo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mosttinymobinfos/1
  # PUT /mosttinymobinfos/1.json
  def update
    @mosttinymobinfo = Mosttinymobinfo.find(params[:id])

    respond_to do |format|
      if @mosttinymobinfo.update_attributes(params[:mosttinymobinfo])
        format.html { redirect_to @mosttinymobinfo, notice: 'Mosttinymobinfo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mosttinymobinfo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mosttinymobinfos/1
  # DELETE /mosttinymobinfos/1.json
  def destroy
    @mosttinymobinfo = Mosttinymobinfo.find(params[:id])
    @mosttinymobinfo.destroy

    respond_to do |format|
      format.html { redirect_to mosttinymobinfos_url }
      format.json { head :no_content }
    end
  end
end
