class MostsmallusersController < ApplicationController
  # GET /mostsmallusers
  # GET /mostsmallusers.json
  def index
    @mostsmallusers = Mostsmalluser.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mostsmallusers }
    end
  end

  # GET /mostsmallusers/1
  # GET /mostsmallusers/1.json
  def show
    @mostsmalluser = Mostsmalluser.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mostsmalluser }
    end
  end

  # GET /mostsmallusers/new
  # GET /mostsmallusers/new.json
  def new
    @mostsmalluser = Mostsmalluser.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mostsmalluser }
    end
  end

  # GET /mostsmallusers/1/edit
  def edit
    @mostsmalluser = Mostsmalluser.find(params[:id])
  end

  # POST /mostsmallusers
  # POST /mostsmallusers.json
  def create
    @mostsmalluser = Mostsmalluser.new(params[:mostsmalluser])

    respond_to do |format|
      if @mostsmalluser.save
        format.html { redirect_to @mostsmalluser, notice: 'Mostsmalluser was successfully created.' }
        format.json { render json: @mostsmalluser, status: :created, location: @mostsmalluser }
      else
        format.html { render action: "new" }
        format.json { render json: @mostsmalluser.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mostsmallusers/1
  # PUT /mostsmallusers/1.json
  def update
    @mostsmalluser = Mostsmalluser.find(params[:id])

    respond_to do |format|
      if @mostsmalluser.update_attributes(params[:mostsmalluser])
        format.html { redirect_to @mostsmalluser, notice: 'Mostsmalluser was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mostsmalluser.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mostsmallusers/1
  # DELETE /mostsmallusers/1.json
  def destroy
    @mostsmalluser = Mostsmalluser.find(params[:id])
    @mostsmalluser.destroy

    respond_to do |format|
      format.html { redirect_to mostsmallusers_url }
      format.json { head :no_content }
    end
  end


  # GET /mostsmallusers/1/mypage
  def mypage
    @mostsmalluser = Mostsmalluser.find(params[:id])
    render
  end

end
