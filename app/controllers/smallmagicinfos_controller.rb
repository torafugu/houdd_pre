class SmallmagicinfosController < ApplicationController
  # GET /smallmagicinfos
  # GET /smallmagicinfos.json
  def index
    @smallmagicinfos = Smallmagicinfo.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @smallmagicinfos }
    end
  end

  # GET /smallmagicinfos/1
  # GET /smallmagicinfos/1.json
  def show
    @smallmagicinfo = Smallmagicinfo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @smallmagicinfo }
    end
  end

  # GET /smallmagicinfos/new
  # GET /smallmagicinfos/new.json
  def new
    @smallmagicinfo = Smallmagicinfo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @smallmagicinfo }
    end
  end

  # GET /smallmagicinfos/1/edit
  def edit
    @smallmagicinfo = Smallmagicinfo.find(params[:id])
  end

  # POST /smallmagicinfos
  # POST /smallmagicinfos.json
  def create
    @smallmagicinfo = Smallmagicinfo.new(params[:smallmagicinfo])

    respond_to do |format|
      if @smallmagicinfo.save
        format.html { redirect_to @smallmagicinfo, notice: 'Smallmagicinfo was successfully created.' }
        format.json { render json: @smallmagicinfo, status: :created, location: @smallmagicinfo }
      else
        format.html { render action: "new" }
        format.json { render json: @smallmagicinfo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /smallmagicinfos/1
  # PUT /smallmagicinfos/1.json
  def update
    @smallmagicinfo = Smallmagicinfo.find(params[:id])

    respond_to do |format|
      if @smallmagicinfo.update_attributes(params[:smallmagicinfo])
        format.html { redirect_to @smallmagicinfo, notice: 'Smallmagicinfo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @smallmagicinfo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /smallmagicinfos/1
  # DELETE /smallmagicinfos/1.json
  def destroy
    @smallmagicinfo = Smallmagicinfo.find(params[:id])
    @smallmagicinfo.destroy

    respond_to do |format|
      format.html { redirect_to smallmagicinfos_url }
      format.json { head :no_content }
    end
  end
end
