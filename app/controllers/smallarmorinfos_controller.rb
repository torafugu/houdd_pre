class SmallarmorinfosController < ApplicationController
  # GET /smallarmorinfos
  # GET /smallarmorinfos.json
  def index
    @smallarmorinfos = Smallarmorinfo.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @smallarmorinfos }
    end
  end

  # GET /smallarmorinfos/1
  # GET /smallarmorinfos/1.json
  def show
    @smallarmorinfo = Smallarmorinfo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @smallarmorinfo }
    end
  end

  # GET /smallarmorinfos/new
  # GET /smallarmorinfos/new.json
  def new
    @smallarmorinfo = Smallarmorinfo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @smallarmorinfo }
    end
  end

  # GET /smallarmorinfos/1/edit
  def edit
    @smallarmorinfo = Smallarmorinfo.find(params[:id])
  end

  # POST /smallarmorinfos
  # POST /smallarmorinfos.json
  def create
    @smallarmorinfo = Smallarmorinfo.new(params[:smallarmorinfo])

    respond_to do |format|
      if @smallarmorinfo.save
        format.html { redirect_to @smallarmorinfo, notice: 'Smallarmorinfo was successfully created.' }
        format.json { render json: @smallarmorinfo, status: :created, location: @smallarmorinfo }
      else
        format.html { render action: "new" }
        format.json { render json: @smallarmorinfo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /smallarmorinfos/1
  # PUT /smallarmorinfos/1.json
  def update
    @smallarmorinfo = Smallarmorinfo.find(params[:id])

    respond_to do |format|
      if @smallarmorinfo.update_attributes(params[:smallarmorinfo])
        format.html { redirect_to @smallarmorinfo, notice: 'Smallarmorinfo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @smallarmorinfo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /smallarmorinfos/1
  # DELETE /smallarmorinfos/1.json
  def destroy
    @smallarmorinfo = Smallarmorinfo.find(params[:id])
    @smallarmorinfo.destroy

    respond_to do |format|
      format.html { redirect_to smallarmorinfos_url }
      format.json { head :no_content }
    end
  end
end
