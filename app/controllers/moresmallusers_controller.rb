class MoresmallusersController < ApplicationController
  # GET /moresmallusers
  # GET /moresmallusers.json
  def index
    @moresmallusers = Moresmalluser.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @moresmallusers }
    end
  end

  # GET /moresmallusers/1
  # GET /moresmallusers/1.json
  def show
    @moresmalluser = Moresmalluser.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @moresmalluser }
    end
  end

  # GET /moresmallusers/new
  # GET /moresmallusers/new.json
  def new
    @moresmalluser = Moresmalluser.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @moresmalluser }
    end
  end

  # GET /moresmallusers/1/edit
  def edit
    @moresmalluser = Moresmalluser.find(params[:id])
  end

  # POST /moresmallusers
  # POST /moresmallusers.json
  def create
    @moresmalluser = Moresmalluser.new(params[:moresmalluser])

    respond_to do |format|
      if @moresmalluser.save
        format.html { redirect_to @moresmalluser, notice: 'Moresmalluser was successfully created.' }
        format.json { render json: @moresmalluser, status: :created, location: @moresmalluser }
      else
        format.html { render action: "new" }
        format.json { render json: @moresmalluser.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /moresmallusers/1
  # PUT /moresmallusers/1.json
  def update
    @moresmalluser = Moresmalluser.find(params[:id])

    respond_to do |format|
      if @moresmalluser.update_attributes(params[:moresmalluser])
        format.html { redirect_to @moresmalluser, notice: 'Moresmalluser was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @moresmalluser.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /moresmallusers/1
  # DELETE /moresmallusers/1.json
  def destroy
    @moresmalluser = Moresmalluser.find(params[:id])
    @moresmalluser.destroy

    respond_to do |format|
      format.html { redirect_to moresmallusers_url }
      format.json { head :no_content }
    end
  end
end
