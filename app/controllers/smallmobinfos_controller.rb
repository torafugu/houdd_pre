class SmallmobinfosController < ApplicationController
  # GET /smallmobinfos
  # GET /smallmobinfos.json
  def index
    @smallmobinfos = Smallmobinfo.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @smallmobinfos }
    end
  end

  # GET /smallmobinfos/1
  # GET /smallmobinfos/1.json
  def show
    @smallmobinfo = Smallmobinfo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @smallmobinfo }
    end
  end

  # GET /smallmobinfos/new
  # GET /smallmobinfos/new.json
  def new
    @smallmobinfo = Smallmobinfo.new
    @smallmobinfo.smallmagicinventories.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @smallmobinfo }
    end
  end

  # GET /smallmobinfos/1/edit
  def edit
    @smallmobinfo = Smallmobinfo.find(params[:id])
    @smallmobinfo.smallmagicinventories.build if @smallmobinfo.smallmagicinventories.blank?
  end

  # POST /smallmobinfos
  # POST /smallmobinfos.json
  def create
    @smallmobinfo = Smallmobinfo.new(params[:smallmobinfo])

    respond_to do |format|
      if @smallmobinfo.save
        format.html { redirect_to @smallmobinfo, notice: 'Smallmobinfo was successfully created.' }
        format.json { render json: @smallmobinfo, status: :created, location: @smallmobinfo }
      else
        format.html { render action: "new" }
        format.json { render json: @smallmobinfo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /smallmobinfos/1
  # PUT /smallmobinfos/1.json
  def update
    @smallmobinfo = Smallmobinfo.find(params[:id])

    respond_to do |format|
      if @smallmobinfo.update_attributes(params[:smallmobinfo])
        format.html { redirect_to @smallmobinfo, notice: 'Smallmobinfo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @smallmobinfo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /smallmobinfos/1
  # DELETE /smallmobinfos/1.json
  def destroy
    @smallmobinfo = Smallmobinfo.find(params[:id])
    @smallmobinfo.destroy

    respond_to do |format|
      format.html { redirect_to smallmobinfos_url }
      format.json { head :no_content }
    end
  end
end
