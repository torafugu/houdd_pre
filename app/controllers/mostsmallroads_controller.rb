class MostsmallroadsController < ApplicationController
  # GET /mostsmallroads
  # GET /mostsmallroads.json
  def index
    @mostsmallroads = Mostsmallroad.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mostsmallroads }
    end
  end

  # GET /mostsmallroads/1
  # GET /mostsmallroads/1.json
  def show
    @mostsmallroad = Mostsmallroad.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mostsmallroad }
    end
  end

  # GET /mostsmallroads/new
  # GET /mostsmallroads/new.json
  def new
    @mostsmallroad = Mostsmallroad.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mostsmallroad }
    end
  end

  # GET /mostsmallroads/1/edit
  def edit
    @mostsmallroad = Mostsmallroad.find(params[:id])
  end

  # POST /mostsmallroads
  # POST /mostsmallroads.json
  def create
    @mostsmallroad = Mostsmallroad.new(params[:mostsmallroad])

    respond_to do |format|
      if @mostsmallroad.save
        format.html { redirect_to @mostsmallroad, notice: 'Mostsmallroad was successfully created.' }
        format.json { render json: @mostsmallroad, status: :created, location: @mostsmallroad }
      else
        format.html { render action: "new" }
        format.json { render json: @mostsmallroad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mostsmallroads/1
  # PUT /mostsmallroads/1.json
  def update
    @mostsmallroad = Mostsmallroad.find(params[:id])

    respond_to do |format|
      if @mostsmallroad.update_attributes(params[:mostsmallroad])
        format.html { redirect_to @mostsmallroad, notice: 'Mostsmallroad was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mostsmallroad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mostsmallroads/1
  # DELETE /mostsmallroads/1.json
  def destroy
    @mostsmallroad = Mostsmallroad.find(params[:id])
    @mostsmallroad.destroy

    respond_to do |format|
      format.html { redirect_to mostsmallroads_url }
      format.json { head :no_content }
    end
  end
end
