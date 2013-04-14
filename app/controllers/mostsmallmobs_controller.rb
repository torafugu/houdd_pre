class MostsmallmobsController < ApplicationController
  # GET /mostsmallmobs
  # GET /mostsmallmobs.json
  def index
    @mostsmallmobs = Mostsmallmob.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mostsmallmobs }
    end
  end

  # GET /mostsmallmobs/1
  # GET /mostsmallmobs/1.json
  def show
    @mostsmallmob = Mostsmallmob.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mostsmallmob }
    end
  end

  # GET /mostsmallmobs/new
  # GET /mostsmallmobs/new.json
  def new
    @mostsmallmob = Mostsmallmob.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mostsmallmob }
    end
  end

  # GET /mostsmallmobs/1/edit
  def edit
    @mostsmallmob = Mostsmallmob.find(params[:id])
  end

  # POST /mostsmallmobs
  # POST /mostsmallmobs.json
  def create
    @mostsmallmob = Mostsmallmob.new(params[:mostsmallmob])

    respond_to do |format|
      if @mostsmallmob.save
        format.html { redirect_to @mostsmallmob, notice: 'Mostsmallmob was successfully created.' }
        format.json { render json: @mostsmallmob, status: :created, location: @mostsmallmob }
      else
        format.html { render action: "new" }
        format.json { render json: @mostsmallmob.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mostsmallmobs/1
  # PUT /mostsmallmobs/1.json
  def update
    @mostsmallmob = Mostsmallmob.find(params[:id])

    respond_to do |format|
      if @mostsmallmob.update_attributes(params[:mostsmallmob])
        format.html { redirect_to @mostsmallmob, notice: 'Mostsmallmob was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mostsmallmob.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mostsmallmobs/1
  # DELETE /mostsmallmobs/1.json
  def destroy
    @mostsmallmob = Mostsmallmob.find(params[:id])
    @mostsmallmob.destroy

    respond_to do |format|
      format.html { redirect_to mostsmallmobs_url }
      format.json { head :no_content }
    end
  end

  # GET /mostsmallmobs/set_default_value
  def set_default_value
    @mostsmallmob = Mostsmallmobcreator.create(params[:mobgene_id])
  end
end
