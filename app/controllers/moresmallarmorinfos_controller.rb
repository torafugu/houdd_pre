class MoresmallarmorinfosController < ApplicationController
  # GET /moresmallarmorinfos
  # GET /moresmallarmorinfos.json
  def index
    @moresmallarmorinfos = Moresmallarmorinfo.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @moresmallarmorinfos }
    end
  end

  # GET /moresmallarmorinfos/1
  # GET /moresmallarmorinfos/1.json
  def show
    @moresmallarmorinfo = Moresmallarmorinfo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @moresmallarmorinfo }
    end
  end

  # GET /moresmallarmorinfos/new
  # GET /moresmallarmorinfos/new.json
  def new
    @moresmallarmorinfo = Moresmallarmorinfo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @moresmallarmorinfo }
    end
  end

  # GET /moresmallarmorinfos/1/edit
  def edit
    @moresmallarmorinfo = Moresmallarmorinfo.find(params[:id])
  end

  # POST /moresmallarmorinfos
  # POST /moresmallarmorinfos.json
  def create
    @moresmallarmorinfo = Moresmallarmorinfo.new(params[:moresmallarmorinfo])

    respond_to do |format|
      if @moresmallarmorinfo.save
        format.html { redirect_to @moresmallarmorinfo, notice: 'Moresmallarmorinfo was successfully created.' }
        format.json { render json: @moresmallarmorinfo, status: :created, location: @moresmallarmorinfo }
      else
        format.html { render action: "new" }
        format.json { render json: @moresmallarmorinfo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /moresmallarmorinfos/1
  # PUT /moresmallarmorinfos/1.json
  def update
    @moresmallarmorinfo = Moresmallarmorinfo.find(params[:id])

    respond_to do |format|
      if @moresmallarmorinfo.update_attributes(params[:moresmallarmorinfo])
        format.html { redirect_to @moresmallarmorinfo, notice: 'Moresmallarmorinfo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @moresmallarmorinfo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /moresmallarmorinfos/1
  # DELETE /moresmallarmorinfos/1.json
  def destroy
    @moresmallarmorinfo = Moresmallarmorinfo.find(params[:id])
    @moresmallarmorinfo.destroy

    respond_to do |format|
      format.html { redirect_to moresmallarmorinfos_url }
      format.json { head :no_content }
    end
  end
end
