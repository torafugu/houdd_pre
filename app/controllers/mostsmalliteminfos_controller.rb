class MostsmalliteminfosController < ApplicationController
  # GET /mostsmalliteminfos
  # GET /mostsmalliteminfos.json
  def index
    @mostsmalliteminfos = Mostsmalliteminfo.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mostsmalliteminfos }
    end
  end

  # GET /mostsmalliteminfos/1
  # GET /mostsmalliteminfos/1.json
  def show
    @mostsmalliteminfo = Mostsmalliteminfo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mostsmalliteminfo }
    end
  end

  # GET /mostsmalliteminfos/new
  # GET /mostsmalliteminfos/new.json
  def new
    @mostsmalliteminfo = Mostsmalliteminfo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mostsmalliteminfo }
    end
  end

  # GET /mostsmalliteminfos/1/edit
  def edit
    @mostsmalliteminfo = Mostsmalliteminfo.find(params[:id])
  end

  # POST /mostsmalliteminfos
  # POST /mostsmalliteminfos.json
  def create
    @mostsmalliteminfo = Mostsmalliteminfo.new(params[:mostsmalliteminfo])

    respond_to do |format|
      if @mostsmalliteminfo.save
        format.html { redirect_to @mostsmalliteminfo, notice: 'Mostsmalliteminfo was successfully created.' }
        format.json { render json: @mostsmalliteminfo, status: :created, location: @mostsmalliteminfo }
      else
        format.html { render action: "new" }
        format.json { render json: @mostsmalliteminfo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mostsmalliteminfos/1
  # PUT /mostsmalliteminfos/1.json
  def update
    @mostsmalliteminfo = Mostsmalliteminfo.find(params[:id])

    respond_to do |format|
      if @mostsmalliteminfo.update_attributes(params[:mostsmalliteminfo])
        format.html { redirect_to @mostsmalliteminfo, notice: 'Mostsmalliteminfo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mostsmalliteminfo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mostsmalliteminfos/1
  # DELETE /mostsmalliteminfos/1.json
  def destroy
    @mostsmalliteminfo = Mostsmalliteminfo.find(params[:id])
    @mostsmalliteminfo.destroy

    respond_to do |format|
      format.html { redirect_to mostsmalliteminfos_url }
      format.json { head :no_content }
    end
  end
end
