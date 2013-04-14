class MostsmalltreasurechestsController < ApplicationController
  # GET /mostsmalltreasurechests
  # GET /mostsmalltreasurechests.json
  def index
    @mostsmalltreasurechests = Mostsmalltreasurechest.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mostsmalltreasurechests }
    end
  end

  # GET /mostsmalltreasurechests/1
  # GET /mostsmalltreasurechests/1.json
  def show
    @mostsmalltreasurechest = Mostsmalltreasurechest.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mostsmalltreasurechest }
    end
  end

  # GET /mostsmalltreasurechests/new
  # GET /mostsmalltreasurechests/new.json
  def new
    @mostsmalltreasurechest = Mostsmalltreasurechest.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mostsmalltreasurechest }
    end
  end

  # GET /mostsmalltreasurechests/1/edit
  def edit
    @mostsmalltreasurechest = Mostsmalltreasurechest.find(params[:id])
  end

  # POST /mostsmalltreasurechests
  # POST /mostsmalltreasurechests.json
  def create
    @mostsmalltreasurechest = Mostsmalltreasurechest.new(params[:mostsmalltreasurechest])

    respond_to do |format|
      if @mostsmalltreasurechest.save
        format.html { redirect_to @mostsmalltreasurechest, notice: 'Mostsmalltreasurechest was successfully created.' }
        format.json { render json: @mostsmalltreasurechest, status: :created, location: @mostsmalltreasurechest }
      else
        format.html { render action: "new" }
        format.json { render json: @mostsmalltreasurechest.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mostsmalltreasurechests/1
  # PUT /mostsmalltreasurechests/1.json
  def update
    @mostsmalltreasurechest = Mostsmalltreasurechest.find(params[:id])

    respond_to do |format|
      if @mostsmalltreasurechest.update_attributes(params[:mostsmalltreasurechest])
        format.html { redirect_to @mostsmalltreasurechest, notice: 'Mostsmalltreasurechest was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mostsmalltreasurechest.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mostsmalltreasurechests/1
  # DELETE /mostsmalltreasurechests/1.json
  def destroy
    @mostsmalltreasurechest = Mostsmalltreasurechest.find(params[:id])
    @mostsmalltreasurechest.destroy

    respond_to do |format|
      format.html { redirect_to mostsmalltreasurechests_url }
      format.json { head :no_content }
    end
  end

  # GET /mostsmalltreasurechests/select_dungeontxt
  # GET /mostsmalltraps/1/select_dungeontxt
  def select_dungeontxt
    @dungeon_txt =Mostsmallterritory.find(params[:territory_id]).dungeon_txt 
  end
end
