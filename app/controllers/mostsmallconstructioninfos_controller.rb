class MostsmallconstructioninfosController < ApplicationController
  # GET /mostsmallconstructioninfos
  # GET /mostsmallconstructioninfos.json
  def index
    @mostsmallconstructioninfos = Mostsmallconstructioninfo.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mostsmallconstructioninfos }
    end
  end

  # GET /mostsmallconstructioninfos/1
  # GET /mostsmallconstructioninfos/1.json
  def show
    @mostsmallconstructioninfo = Mostsmallconstructioninfo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mostsmallconstructioninfo }
    end
  end

  # GET /mostsmallconstructioninfos/new
  # GET /mostsmallconstructioninfos/new.json
  def new
    @mostsmallconstructioninfo = Mostsmallconstructioninfo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mostsmallconstructioninfo }
    end
  end

  # GET /mostsmallconstructioninfos/1/edit
  def edit
    @mostsmallconstructioninfo = Mostsmallconstructioninfo.find(params[:id])
  end

  # POST /mostsmallconstructioninfos
  # POST /mostsmallconstructioninfos.json
  def create
    @mostsmallconstructioninfo = Mostsmallconstructioninfo.new(params[:mostsmallconstructioninfo])

    respond_to do |format|
      if @mostsmallconstructioninfo.save
        format.html { redirect_to @mostsmallconstructioninfo, notice: 'Mostsmallconstructioninfo was successfully created.' }
        format.json { render json: @mostsmallconstructioninfo, status: :created, location: @mostsmallconstructioninfo }
      else
        format.html { render action: "new" }
        format.json { render json: @mostsmallconstructioninfo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mostsmallconstructioninfos/1
  # PUT /mostsmallconstructioninfos/1.json
  def update
    @mostsmallconstructioninfo = Mostsmallconstructioninfo.find(params[:id])

    respond_to do |format|
      if @mostsmallconstructioninfo.update_attributes(params[:mostsmallconstructioninfo])
        format.html { redirect_to @mostsmallconstructioninfo, notice: 'Mostsmallconstructioninfo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mostsmallconstructioninfo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mostsmallconstructioninfos/1
  # DELETE /mostsmallconstructioninfos/1.json
  def destroy
    @mostsmallconstructioninfo = Mostsmallconstructioninfo.find(params[:id])
    @mostsmallconstructioninfo.destroy

    respond_to do |format|
      format.html { redirect_to mostsmallconstructioninfos_url }
      format.json { head :no_content }
    end
  end
end
