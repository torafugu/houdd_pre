class SmallmapsController < ApplicationController
  # GET /smallmaps
  # GET /smallmaps.json
  def index
    @smallmaps = Smallmap.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @smallmaps }
    end
  end

  # GET /smallmaps/1
  # GET /smallmaps/1.json
  def show
    @smallmap = Smallmap.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @smallmap }
    end
  end

  # GET /smallmaps/new
  # GET /smallmaps/new.json
  def new
    @smallmap = Smallmap.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @smallmap }
    end
  end

  # GET /smallmaps/1/edit
  def edit
    @smallmap = Smallmap.find(params[:id])
  end

  # POST /smallmaps
  # POST /smallmaps.json
  def create
    @smallmap = Smallmap.new(params[:smallmap])

    respond_to do |format|
      if @smallmap.save
        format.html { redirect_to @smallmap, notice: 'Smallmap was successfully created.' }
        format.json { render json: @smallmap, status: :created, location: @smallmap }
      else
        format.html { render action: "new" }
        format.json { render json: @smallmap.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /smallmaps/1
  # PUT /smallmaps/1.json
  def update
    @smallmap = Smallmap.find(params[:id])

    respond_to do |format|
      if @smallmap.update_attributes(params[:smallmap])
        format.html { redirect_to @smallmap, notice: 'Smallmap was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @smallmap.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /smallmaps/1
  # DELETE /smallmaps/1.json
  def destroy
    @smallmap = Smallmap.find(params[:id])
    @smallmap.destroy

    respond_to do |format|
      format.html { redirect_to smallmaps_url }
      format.json { head :no_content }
    end
  end
end
