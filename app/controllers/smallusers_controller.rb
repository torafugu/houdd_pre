class SmallusersController < ApplicationController
  # GET /smallusers
  # GET /smallusers.json
  def index
    @smallusers = Smalluser.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @smallusers }
    end
  end

  # GET /smallusers/1
  # GET /smallusers/1.json
  def show
    @smalluser = Smalluser.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @smalluser }
    end
  end

  # GET /smallusers/new
  # GET /smallusers/new.json
  def new
    @smalluser = Smalluser.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @smalluser }
    end
  end

  # GET /smallusers/1/edit
  def edit
    @smalluser = Smalluser.find(params[:id])
  end

  # POST /smallusers
  # POST /smallusers.json
  def create
    @smalluser = Smalluser.new(params[:smalluser])

    respond_to do |format|
      if @smalluser.save
        format.html { redirect_to @smalluser, notice: 'Smalluser was successfully created.' }
        format.json { render json: @smalluser, status: :created, location: @smalluser }
      else
        format.html { render action: "new" }
        format.json { render json: @smalluser.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /smallusers/1
  # PUT /smallusers/1.json
  def update
    @smalluser = Smalluser.find(params[:id])

    respond_to do |format|
      if @smalluser.update_attributes(params[:smalluser])
        format.html { redirect_to @smalluser, notice: 'Smalluser was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @smalluser.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /smallusers/1
  # DELETE /smallusers/1.json
  def destroy
    @smalluser = Smalluser.find(params[:id])
    @smalluser.destroy

    respond_to do |format|
      format.html { redirect_to smallusers_url }
      format.json { head :no_content }
    end
  end
end
