class MostsmalltrapinfosController < ApplicationController
  # GET /mostsmalltrapinfos
  # GET /mostsmalltrapinfos.json
  def index
    @mostsmalltrapinfos = Mostsmalltrapinfo.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mostsmalltrapinfos }
    end
  end

  # GET /mostsmalltrapinfos/1
  # GET /mostsmalltrapinfos/1.json
  def show
    @mostsmalltrapinfo = Mostsmalltrapinfo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mostsmalltrapinfo }
    end
  end

  # GET /mostsmalltrapinfos/new
  # GET /mostsmalltrapinfos/new.json
  def new
    @mostsmalltrapinfo = Mostsmalltrapinfo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mostsmalltrapinfo }
    end
  end

  # GET /mostsmalltrapinfos/1/edit
  def edit
    @mostsmalltrapinfo = Mostsmalltrapinfo.find(params[:id])
  end

  # POST /mostsmalltrapinfos
  # POST /mostsmalltrapinfos.json
  def create
    @mostsmalltrapinfo = Mostsmalltrapinfo.new(params[:mostsmalltrapinfo])

    respond_to do |format|
      if @mostsmalltrapinfo.save
        format.html { redirect_to @mostsmalltrapinfo, notice: 'Mostsmalltrapinfo was successfully created.' }
        format.json { render json: @mostsmalltrapinfo, status: :created, location: @mostsmalltrapinfo }
      else
        format.html { render action: "new" }
        format.json { render json: @mostsmalltrapinfo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mostsmalltrapinfos/1
  # PUT /mostsmalltrapinfos/1.json
  def update
    @mostsmalltrapinfo = Mostsmalltrapinfo.find(params[:id])

    respond_to do |format|
      if @mostsmalltrapinfo.update_attributes(params[:mostsmalltrapinfo])
        format.html { redirect_to @mostsmalltrapinfo, notice: 'Mostsmalltrapinfo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mostsmalltrapinfo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mostsmalltrapinfos/1
  # DELETE /mostsmalltrapinfos/1.json
  def destroy
    @mostsmalltrapinfo = Mostsmalltrapinfo.find(params[:id])
    @mostsmalltrapinfo.destroy

    respond_to do |format|
      format.html { redirect_to mostsmalltrapinfos_url }
      format.json { head :no_content }
    end
  end
end
