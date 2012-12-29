class MoresmallmapsController < ApplicationController
  # GET /moresmallmaps
  # GET /moresmallmaps.json
  def index
    @moresmallmaps = Moresmallmap.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @moresmallmaps }
    end
  end

  # GET /moresmallmaps/1
  # GET /moresmallmaps/1.json
  def show
    @moresmallmap = Moresmallmap.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @moresmallmap }
    end
  end

  # GET /moresmallmaps/new
  # GET /moresmallmaps/new.json
  def new
    @moresmallmap = Moresmallmap.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @moresmallmap }
    end
  end

  # GET /moresmallmaps/1/edit
  def edit
    @moresmallmap = Moresmallmap.find(params[:id])
  end

  # POST /moresmallmaps
  # POST /moresmallmaps.json
  def create
    @moresmallmap = Moresmallmap.new(params[:moresmallmap])

    respond_to do |format|
      if @moresmallmap.save
        format.html { redirect_to @moresmallmap, notice: 'Moresmallmap was successfully created.' }
        format.json { render json: @moresmallmap, status: :created, location: @moresmallmap }
      else
        format.html { render action: "new" }
        format.json { render json: @moresmallmap.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /moresmallmaps/1
  # PUT /moresmallmaps/1.json
  def update
    @moresmallmap = Moresmallmap.find(params[:id])

    respond_to do |format|
      if @moresmallmap.update_attributes(params[:moresmallmap])
        format.html { redirect_to @moresmallmap, notice: 'Moresmallmap was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @moresmallmap.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /moresmallmaps/1
  # DELETE /moresmallmaps/1.json
  def destroy
    @moresmallmap = Moresmallmap.find(params[:id])
    @moresmallmap.destroy

    respond_to do |format|
      format.html { redirect_to moresmallmaps_url }
      format.json { head :no_content }
    end
  end
end
