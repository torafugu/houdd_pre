class MoresmallmagicinfosController < ApplicationController
  # GET /moresmallmagicinfos
  # GET /moresmallmagicinfos.json
  def index
    @moresmallmagicinfos = Moresmallmagicinfo.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @moresmallmagicinfos }
    end
  end

  # GET /moresmallmagicinfos/1
  # GET /moresmallmagicinfos/1.json
  def show
    @moresmallmagicinfo = Moresmallmagicinfo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @moresmallmagicinfo }
    end
  end

  # GET /moresmallmagicinfos/new
  # GET /moresmallmagicinfos/new.json
  def new
    @moresmallmagicinfo = Moresmallmagicinfo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @moresmallmagicinfo }
    end
  end

  # GET /moresmallmagicinfos/1/edit
  def edit
    @moresmallmagicinfo = Moresmallmagicinfo.find(params[:id])
  end

  # POST /moresmallmagicinfos
  # POST /moresmallmagicinfos.json
  def create
    @moresmallmagicinfo = Moresmallmagicinfo.new(params[:moresmallmagicinfo])

    respond_to do |format|
      if @moresmallmagicinfo.save
        format.html { redirect_to @moresmallmagicinfo, notice: 'Moresmallmagicinfo was successfully created.' }
        format.json { render json: @moresmallmagicinfo, status: :created, location: @moresmallmagicinfo }
      else
        format.html { render action: "new" }
        format.json { render json: @moresmallmagicinfo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /moresmallmagicinfos/1
  # PUT /moresmallmagicinfos/1.json
  def update
    @moresmallmagicinfo = Moresmallmagicinfo.find(params[:id])

    respond_to do |format|
      if @moresmallmagicinfo.update_attributes(params[:moresmallmagicinfo])
        format.html { redirect_to @moresmallmagicinfo, notice: 'Moresmallmagicinfo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @moresmallmagicinfo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /moresmallmagicinfos/1
  # DELETE /moresmallmagicinfos/1.json
  def destroy
    @moresmallmagicinfo = Moresmallmagicinfo.find(params[:id])
    @moresmallmagicinfo.destroy

    respond_to do |format|
      format.html { redirect_to moresmallmagicinfos_url }
      format.json { head :no_content }
    end
  end
end
