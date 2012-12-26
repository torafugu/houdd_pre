class SmallweponinfosController < ApplicationController
  # GET /smallweponinfos
  # GET /smallweponinfos.json
  def index
    @smallweponinfos = Smallweponinfo.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @smallweponinfos }
    end
  end

  # GET /smallweponinfos/1
  # GET /smallweponinfos/1.json
  def show
    @smallweponinfo = Smallweponinfo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @smallweponinfo }
    end
  end

  # GET /smallweponinfos/new
  # GET /smallweponinfos/new.json
  def new
    @smallweponinfo = Smallweponinfo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @smallweponinfo }
    end
  end

  # GET /smallweponinfos/1/edit
  def edit
    @smallweponinfo = Smallweponinfo.find(params[:id])
  end

  # POST /smallweponinfos
  # POST /smallweponinfos.json
  def create
    @smallweponinfo = Smallweponinfo.new(params[:smallweponinfo])

    respond_to do |format|
      if @smallweponinfo.save
        format.html { redirect_to @smallweponinfo, notice: 'Smallweponinfo was successfully created.' }
        format.json { render json: @smallweponinfo, status: :created, location: @smallweponinfo }
      else
        format.html { render action: "new" }
        format.json { render json: @smallweponinfo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /smallweponinfos/1
  # PUT /smallweponinfos/1.json
  def update
    @smallweponinfo = Smallweponinfo.find(params[:id])

    respond_to do |format|
      if @smallweponinfo.update_attributes(params[:smallweponinfo])
        format.html { redirect_to @smallweponinfo, notice: 'Smallweponinfo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @smallweponinfo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /smallweponinfos/1
  # DELETE /smallweponinfos/1.json
  def destroy
    @smallweponinfo = Smallweponinfo.find(params[:id])
    @smallweponinfo.destroy

    respond_to do |format|
      format.html { redirect_to smallweponinfos_url }
      format.json { head :no_content }
    end
  end
end
