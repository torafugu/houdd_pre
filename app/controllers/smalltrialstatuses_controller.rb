class SmalltrialstatusesController < ApplicationController
  # GET /smalltrialstatuses
  # GET /smalltrialstatuses.json
  def index
    @smalltrialstatuses = Smalltrialstatus.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @smalltrialstatuses }
    end
  end

  # GET /smalltrialstatuses/1
  # GET /smalltrialstatuses/1.json
  def show
    @smalltrialstatus = Smalltrialstatus.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @smalltrialstatus }
    end
  end

  # GET /smalltrialstatuses/new
  # GET /smalltrialstatuses/new.json
  def new
    @smalltrialstatus = Smalltrialstatus.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @smalltrialstatus }
    end
  end

  # GET /smalltrialstatuses/1/edit
  def edit
    @smalltrialstatus = Smalltrialstatus.find(params[:id])
  end

  # POST /smalltrialstatuses
  # POST /smalltrialstatuses.json
  def create
    @smalltrialstatus = Smalltrialstatus.new(params[:smalltrialstatus])

    respond_to do |format|
      if @smalltrialstatus.save
        format.html { redirect_to @smalltrialstatus, notice: 'Smalltrialstatus was successfully created.' }
        format.json { render json: @smalltrialstatus, status: :created, location: @smalltrialstatus }
      else
        format.html { render action: "new" }
        format.json { render json: @smalltrialstatus.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /smalltrialstatuses/1
  # PUT /smalltrialstatuses/1.json
  def update
    @smalltrialstatus = Smalltrialstatus.find(params[:id])

    respond_to do |format|
      if @smalltrialstatus.update_attributes(params[:smalltrialstatus])
        format.html { redirect_to @smalltrialstatus, notice: 'Smalltrialstatus was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @smalltrialstatus.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /smalltrialstatuses/1
  # DELETE /smalltrialstatuses/1.json
  def destroy
    @smalltrialstatus = Smalltrialstatus.find(params[:id])
    @smalltrialstatus.destroy

    respond_to do |format|
      format.html { redirect_to smalltrialstatuses_url }
      format.json { head :no_content }
    end
  end
end
