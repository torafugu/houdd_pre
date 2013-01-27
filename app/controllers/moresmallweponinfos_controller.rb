class MoresmallweponinfosController < ApplicationController
  # GET /moresmallweponinfos
  # GET /moresmallweponinfos.json
  def index
    @moresmallweponinfos = Moresmallweponinfo.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @moresmallweponinfos }
    end
  end

  # GET /moresmallweponinfos/1
  # GET /moresmallweponinfos/1.json
  def show
    @moresmallweponinfo = Moresmallweponinfo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @moresmallweponinfo }
    end
  end

  # GET /moresmallweponinfos/new
  # GET /moresmallweponinfos/new.json
  def new
    @moresmallweponinfo = Moresmallweponinfo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @moresmallweponinfo }
    end
  end

  # GET /moresmallweponinfos/1/edit
  def edit
    @moresmallweponinfo = Moresmallweponinfo.find(params[:id])
  end

  # POST /moresmallweponinfos
  # POST /moresmallweponinfos.json
  def create
    @moresmallweponinfo = Moresmallweponinfo.new(params[:moresmallweponinfo])

    respond_to do |format|
      if @moresmallweponinfo.save
        format.html { redirect_to @moresmallweponinfo, notice: 'Moresmallweponinfo was successfully created.' }
        format.json { render json: @moresmallweponinfo, status: :created, location: @moresmallweponinfo }
      else
        format.html { render action: "new" }
        format.json { render json: @moresmallweponinfo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /moresmallweponinfos/1
  # PUT /moresmallweponinfos/1.json
  def update
    @moresmallweponinfo = Moresmallweponinfo.find(params[:id])

    respond_to do |format|
      if @moresmallweponinfo.update_attributes(params[:moresmallweponinfo])
        format.html { redirect_to @moresmallweponinfo, notice: 'Moresmallweponinfo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @moresmallweponinfo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /moresmallweponinfos/1
  # DELETE /moresmallweponinfos/1.json
  def destroy
    @moresmallweponinfo = Moresmallweponinfo.find(params[:id])
    @moresmallweponinfo.destroy

    respond_to do |format|
      format.html { redirect_to moresmallweponinfos_url }
      format.json { head :no_content }
    end
  end
end
