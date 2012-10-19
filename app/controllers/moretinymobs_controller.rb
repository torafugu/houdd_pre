class MoretinymobsController < ApplicationController
  # GET /moretinymobs
  # GET /moretinymobs.json
  def index
    @moretinymobs = Moretinymob.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @moretinymobs }
    end
  end

  # GET /moretinymobs/1
  # GET /moretinymobs/1.json
  def show
    @moretinymob = Moretinymob.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @moretinymob }
    end
  end

  # GET /moretinymobs/new
  # GET /moretinymobs/new.json
  def new
    @moretinymob = Moretinymob.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @moretinymob }
    end
  end

  # GET /moretinymobs/1/edit
  def edit
    @moretinymob = Moretinymob.find(params[:id])
  end

  # POST /moretinymobs
  # POST /moretinymobs.json
  def create
    @moretinymob = Moretinymob.new(params[:moretinymob])

    respond_to do |format|
      if @moretinymob.save
        format.html { redirect_to @moretinymob, notice: 'Moretinymob was successfully created.' }
        format.json { render json: @moretinymob, status: :created, location: @moretinymob }
      else
        format.html { render action: "new" }
        format.json { render json: @moretinymob.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /moretinymobs/1
  # PUT /moretinymobs/1.json
  def update
    @moretinymob = Moretinymob.find(params[:id])

    respond_to do |format|
      if @moretinymob.update_attributes(params[:moretinymob])
        format.html { redirect_to @moretinymob, notice: 'Moretinymob was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @moretinymob.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /moretinymobs/1
  # DELETE /moretinymobs/1.json
  def destroy
    @moretinymob = Moretinymob.find(params[:id])
    @moretinymob.destroy

    respond_to do |format|
      format.html { redirect_to moretinymobs_url }
      format.json { head :no_content }
    end
  end
end
