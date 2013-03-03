class MostsmalltrapsController < ApplicationController
  # GET /mostsmalltraps
  # GET /mostsmalltraps.json
  def index
    @mostsmalltraps = Mostsmalltrap.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mostsmalltraps }
    end
  end

  # GET /mostsmalltraps/1
  # GET /mostsmalltraps/1.json
  def show
    @mostsmalltrap = Mostsmalltrap.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mostsmalltrap }
    end
  end

  # GET /mostsmalltraps/new
  # GET /mostsmalltraps/new.json
  def new
    @mostsmalltrap = Mostsmalltrap.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mostsmalltrap }
    end
  end

  # GET /mostsmalltraps/1/edit
  def edit
    @mostsmalltrap = Mostsmalltrap.find(params[:id])
  end

  # POST /mostsmalltraps
  # POST /mostsmalltraps.json
  def create
    @mostsmalltrap = Mostsmalltrap.new(params[:mostsmalltrap])

    respond_to do |format|
      if @mostsmalltrap.save
        format.html { redirect_to @mostsmalltrap, notice: 'Mostsmalltrap was successfully created.' }
        format.json { render json: @mostsmalltrap, status: :created, location: @mostsmalltrap }
      else
        format.html { render action: "new" }
        format.json { render json: @mostsmalltrap.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mostsmalltraps/1
  # PUT /mostsmalltraps/1.json
  def update
    @mostsmalltrap = Mostsmalltrap.find(params[:id])

    respond_to do |format|
      if @mostsmalltrap.update_attributes(params[:mostsmalltrap])
        format.html { redirect_to @mostsmalltrap, notice: 'Mostsmalltrap was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mostsmalltrap.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mostsmalltraps/1
  # DELETE /mostsmalltraps/1.json
  def destroy
    @mostsmalltrap = Mostsmalltrap.find(params[:id])
    @mostsmalltrap.destroy

    respond_to do |format|
      format.html { redirect_to mostsmalltraps_url }
      format.json { head :no_content }
    end
  end

  # GET /mostsmalltraps/select_dungeontxt
  # GET /mostsmalltraps/1/select_dungeontxt
  def select_dungeontxt
    @dungeon_txt =Mostsmallterritory.find(params[:territory_id]).dungeon_txt 
  end
end
