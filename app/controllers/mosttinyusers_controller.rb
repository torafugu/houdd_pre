class MosttinyusersController < ApplicationController
  # GET /mosttinyusers
  # GET /mosttinyusers.json
  def index
    @mosttinyusers = Mosttinyuser.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mosttinyusers }
    end
  end

  # GET /mosttinyusers/1
  # GET /mosttinyusers/1.json
  def show
    @mosttinyuser = Mosttinyuser.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mosttinyuser }
    end
  end

  # GET /mosttinyusers/new
  # GET /mosttinyusers/new.json
  def new
    @mosttinyuser = Mosttinyuser.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mosttinyuser }
    end
  end

  # GET /mosttinyusers/1/edit
  def edit
    @mosttinyuser = Mosttinyuser.find(params[:id])
  end

  # POST /mosttinyusers
  # POST /mosttinyusers.json
  def create
    @mosttinyuser = Mosttinyuser.new(params[:mosttinyuser])

    respond_to do |format|
      if @mosttinyuser.save
        format.html { redirect_to @mosttinyuser, notice: 'Mosttinyuser was successfully created.' }
        format.json { render json: @mosttinyuser, status: :created, location: @mosttinyuser }
      else
        format.html { render action: "new" }
        format.json { render json: @mosttinyuser.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mosttinyusers/1
  # PUT /mosttinyusers/1.json
  def update
    @mosttinyuser = Mosttinyuser.find(params[:id])

    respond_to do |format|
      if @mosttinyuser.update_attributes(params[:mosttinyuser])
        format.html { redirect_to @mosttinyuser, notice: 'Mosttinyuser was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mosttinyuser.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mosttinyusers/1
  # DELETE /mosttinyusers/1.json
  def destroy
    @mosttinyuser = Mosttinyuser.find(params[:id])
    @mosttinyuser.destroy

    respond_to do |format|
      format.html { redirect_to mosttinyusers_url }
      format.json { head :no_content }
    end
  end
end
