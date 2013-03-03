class MostsmalljobsController < ApplicationController
  # GET /mostsmalljobs
  # GET /mostsmalljobs.json
  def index
    @mostsmalljobs = Mostsmalljob.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mostsmalljobs }
    end
  end

  # GET /mostsmalljobs/1
  # GET /mostsmalljobs/1.json
  def show
    @mostsmalljob = Mostsmalljob.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mostsmalljob }
    end
  end

  # GET /mostsmalljobs/new
  # GET /mostsmalljobs/new.json
  def new
    @mostsmalljob = Mostsmalljob.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mostsmalljob }
    end
  end

  # GET /mostsmalljobs/1/edit
  def edit
    @mostsmalljob = Mostsmalljob.find(params[:id])
  end

  # POST /mostsmalljobs
  # POST /mostsmalljobs.json
  def create
    @mostsmalljob = Mostsmalljob.new(params[:mostsmalljob])

    respond_to do |format|
      if @mostsmalljob.save
        format.html { redirect_to @mostsmalljob, notice: 'Mostsmalljob was successfully created.' }
        format.json { render json: @mostsmalljob, status: :created, location: @mostsmalljob }
      else
        format.html { render action: "new" }
        format.json { render json: @mostsmalljob.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mostsmalljobs/1
  # PUT /mostsmalljobs/1.json
  def update
    @mostsmalljob = Mostsmalljob.find(params[:id])

    respond_to do |format|
      if @mostsmalljob.update_attributes(params[:mostsmalljob])
        format.html { redirect_to @mostsmalljob, notice: 'Mostsmalljob was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mostsmalljob.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mostsmalljobs/1
  # DELETE /mostsmalljobs/1.json
  def destroy
    @mostsmalljob = Mostsmalljob.find(params[:id])
    @mostsmalljob.destroy

    respond_to do |format|
      format.html { redirect_to mostsmalljobs_url }
      format.json { head :no_content }
    end
  end
end
