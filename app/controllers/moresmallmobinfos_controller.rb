class MoresmallmobinfosController < ApplicationController
  # GET /moresmallmobinfos
  # GET /moresmallmobinfos.json
  def index
    @moresmallmobinfos = Moresmallmobinfo.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @moresmallmobinfos }
    end
  end

  # GET /moresmallmobinfos/1
  # GET /moresmallmobinfos/1.json
  def show
    @moresmallmobinfo = Moresmallmobinfo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @moresmallmobinfo }
    end
  end

  # GET /moresmallmobinfos/new
  # GET /moresmallmobinfos/new.json
  def new
    @moresmallmobinfo = Moresmallmobinfo.new
    @moresmallmobinfo.moresmallmagicinventories.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @moresmallmobinfo }
    end
  end

  # GET /moresmallmobinfos/1/edit
  def edit
    @moresmallmobinfo = Moresmallmobinfo.find(params[:id])
    @moresmallmobinfo.moresmallmagicinventories.build if @moresmallmobinfo.moresmallmagicinventories.blank?
  end

  # POST /moresmallmobinfos
  # POST /moresmallmobinfos.json
  def create
    @moresmallmobinfo = Moresmallmobinfo.new(params[:moresmallmobinfo])

    respond_to do |format|
      if @moresmallmobinfo.save
        format.html { redirect_to @moresmallmobinfo, notice: 'Moresmallmobinfo was successfully created.' }
        format.json { render json: @moresmallmobinfo, status: :created, location: @moresmallmobinfo }
      else
        format.html { render action: "new" }
        format.json { render json: @moresmallmobinfo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /moresmallmobinfos/1
  # PUT /moresmallmobinfos/1.json
  def update
    @moresmallmobinfo = Moresmallmobinfo.find(params[:id])

    respond_to do |format|
      if @moresmallmobinfo.update_attributes(params[:moresmallmobinfo])
        format.html { redirect_to @moresmallmobinfo, notice: 'Moresmallmobinfo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @moresmallmobinfo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /moresmallmobinfos/1
  # DELETE /moresmallmobinfos/1.json
  def destroy
    @moresmallmobinfo = Moresmallmobinfo.find(params[:id])
    @moresmallmobinfo.destroy

    respond_to do |format|
      format.html { redirect_to moresmallmobinfos_url }
      format.json { head :no_content }
    end
  end
end
