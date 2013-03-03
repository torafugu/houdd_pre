class MostsmalltrapeffectinventoriesController < ApplicationController
  # GET /mostsmalltrapeffectinventories
  # GET /mostsmalltrapeffectinventories.json
  def index
    @mostsmalltrapeffectinventories = Mostsmalltrapeffectinventory.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mostsmalltrapeffectinventories }
    end
  end

  # GET /mostsmalltrapeffectinventories/1
  # GET /mostsmalltrapeffectinventories/1.json
  def show
    @mostsmalltrapeffectinventory = Mostsmalltrapeffectinventory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mostsmalltrapeffectinventory }
    end
  end

  # GET /mostsmalltrapeffectinventories/new
  # GET /mostsmalltrapeffectinventories/new.json
  def new
    @mostsmalltrapeffectinventory = Mostsmalltrapeffectinventory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mostsmalltrapeffectinventory }
    end
  end

  # GET /mostsmalltrapeffectinventories/1/edit
  def edit
    @mostsmalltrapeffectinventory = Mostsmalltrapeffectinventory.find(params[:id])
  end

  # POST /mostsmalltrapeffectinventories
  # POST /mostsmalltrapeffectinventories.json
  def create
    @mostsmalltrapeffectinventory = Mostsmalltrapeffectinventory.new(params[:mostsmalltrapeffectinventory])

    respond_to do |format|
      if @mostsmalltrapeffectinventory.save
        format.html { redirect_to @mostsmalltrapeffectinventory, notice: 'Mostsmalltrapeffectinventory was successfully created.' }
        format.json { render json: @mostsmalltrapeffectinventory, status: :created, location: @mostsmalltrapeffectinventory }
      else
        format.html { render action: "new" }
        format.json { render json: @mostsmalltrapeffectinventory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mostsmalltrapeffectinventories/1
  # PUT /mostsmalltrapeffectinventories/1.json
  def update
    @mostsmalltrapeffectinventory = Mostsmalltrapeffectinventory.find(params[:id])

    respond_to do |format|
      if @mostsmalltrapeffectinventory.update_attributes(params[:mostsmalltrapeffectinventory])
        format.html { redirect_to @mostsmalltrapeffectinventory, notice: 'Mostsmalltrapeffectinventory was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mostsmalltrapeffectinventory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mostsmalltrapeffectinventories/1
  # DELETE /mostsmalltrapeffectinventories/1.json
  def destroy
    @mostsmalltrapeffectinventory = Mostsmalltrapeffectinventory.find(params[:id])
    @mostsmalltrapeffectinventory.destroy

    respond_to do |format|
      format.html { redirect_to mostsmalltrapeffectinventories_url }
      format.json { head :no_content }
    end
  end
end
