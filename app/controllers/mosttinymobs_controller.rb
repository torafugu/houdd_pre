class MosttinymobsController < ApplicationController
  # GET /mosttinymobs
  # GET /mosttinymobs.json
  def index
    @mosttinymobs = Mosttinymob.all(:include => [:mosttinyuser, :mosttinymobinfo])


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mosttinymobs }
    end
  end

  # GET /mosttinymobs/1
  # GET /mosttinymobs/1.json
  def show
    @mosttinymob = Mosttinymob.find(params[:id], :include => [:mosttinyuser, :mosttinymobinfo])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mosttinymob }
    end
  end

  # GET /mosttinymobs/new
  # GET /mosttinymobs/new.json
  def new
    @mosttinymob = Mosttinymob.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mosttinymob }
    end
  end

  # GET /mosttinymobs/1/edit
  def edit
    @mosttinymob = Mosttinymob.find(params[:id])
  end

  # POST /mosttinymobs
  # POST /mosttinymobs.json
  def create
    @mosttinymob = Mosttinymob.new(params[:mosttinymob])

    respond_to do |format|
      if @mosttinymob.save
        format.html { redirect_to @mosttinymob, notice: 'Mosttinymob was successfully created.' }
        format.json { render json: @mosttinymob, status: :created, location: @mosttinymob }
      else
        format.html { render action: "new" }
        format.json { render json: @mosttinymob.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mosttinymobs/1
  # PUT /mosttinymobs/1.json
  def update
    @mosttinymob = Mosttinymob.find(params[:id])

    respond_to do |format|
      if @mosttinymob.update_attributes(params[:mosttinymob])
        format.html { redirect_to @mosttinymob, notice: 'Mosttinymob was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mosttinymob.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mosttinymobs/1
  # DELETE /mosttinymobs/1.json
  def destroy
    @mosttinymob = Mosttinymob.find(params[:id])
    @mosttinymob.destroy

    respond_to do |format|
      format.html { redirect_to mosttinymobs_url }
      format.json { head :no_content }
    end
  end
end
