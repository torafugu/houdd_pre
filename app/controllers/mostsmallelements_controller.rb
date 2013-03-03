class MostsmallelementsController < ApplicationController
  # GET /mostsmallelements
  # GET /mostsmallelements.json
  def index
    @mostsmallelements = Mostsmallelement.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mostsmallelements }
    end
  end

  # GET /mostsmallelements/1
  # GET /mostsmallelements/1.json
  def show
    @mostsmallelement = Mostsmallelement.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mostsmallelement }
    end
  end

  # GET /mostsmallelements/new
  # GET /mostsmallelements/new.json
  def new
    @mostsmallelement = Mostsmallelement.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mostsmallelement }
    end
  end

  # GET /mostsmallelements/1/edit
  def edit
    @mostsmallelement = Mostsmallelement.find(params[:id])
  end

  # POST /mostsmallelements
  # POST /mostsmallelements.json
  def create
    @mostsmallelement = Mostsmallelement.new(params[:mostsmallelement])

    respond_to do |format|
      if @mostsmallelement.save
        format.html { redirect_to @mostsmallelement, notice: 'Mostsmallelement was successfully created.' }
        format.json { render json: @mostsmallelement, status: :created, location: @mostsmallelement }
      else
        format.html { render action: "new" }
        format.json { render json: @mostsmallelement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mostsmallelements/1
  # PUT /mostsmallelements/1.json
  def update
    @mostsmallelement = Mostsmallelement.find(params[:id])

    respond_to do |format|
      if @mostsmallelement.update_attributes(params[:mostsmallelement])
        format.html { redirect_to @mostsmallelement, notice: 'Mostsmallelement was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mostsmallelement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mostsmallelements/1
  # DELETE /mostsmallelements/1.json
  def destroy
    @mostsmallelement = Mostsmallelement.find(params[:id])
    @mostsmallelement.destroy

    respond_to do |format|
      format.html { redirect_to mostsmallelements_url }
      format.json { head :no_content }
    end
  end
end
