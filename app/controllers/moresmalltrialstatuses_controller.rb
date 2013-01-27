class MoresmalltrialstatusesController < ApplicationController
  # GET /moresmalltrialstatuses
  # GET /moresmalltrialstatuses.json
  def index
    @moresmalltrialstatuses = Moresmalltrialstatus.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @moresmalltrialstatuses }
    end
  end

  # GET /moresmalltrialstatuses/1
  # GET /moresmalltrialstatuses/1.json
  def show
    @moresmalltrialstatus = Moresmalltrialstatus.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @moresmalltrialstatus }
    end
  end

  # GET /moresmalltrialstatuses/new
  # GET /moresmalltrialstatuses/new.json
  def new
    @moresmalltrialstatus = Moresmalltrialstatus.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @moresmalltrialstatus }
    end
  end

  # GET /moresmalltrialstatuses/1/edit
  def edit
    @moresmalltrialstatus = Moresmalltrialstatus.find(params[:id])
  end

  # POST /moresmalltrialstatuses
  # POST /moresmalltrialstatuses.json
  def create
    @moresmalltrialstatus = Moresmalltrialstatus.new(params[:moresmalltrialstatus])

    respond_to do |format|
      if @moresmalltrialstatus.save
        format.html { redirect_to @moresmalltrialstatus, notice: 'Moresmalltrialstatus was successfully created.' }
        format.json { render json: @moresmalltrialstatus, status: :created, location: @moresmalltrialstatus }
      else
        format.html { render action: "new" }
        format.json { render json: @moresmalltrialstatus.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /moresmalltrialstatuses/1
  # PUT /moresmalltrialstatuses/1.json
  def update
    @moresmalltrialstatus = Moresmalltrialstatus.find(params[:id])

    respond_to do |format|
      if @moresmalltrialstatus.update_attributes(params[:moresmalltrialstatus])
        format.html { redirect_to @moresmalltrialstatus, notice: 'Moresmalltrialstatus was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @moresmalltrialstatus.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /moresmalltrialstatuses/1
  # DELETE /moresmalltrialstatuses/1.json
  def destroy
    @moresmalltrialstatus = Moresmalltrialstatus.find(params[:id])
    @moresmalltrialstatus.destroy

    respond_to do |format|
      format.html { redirect_to moresmalltrialstatuses_url }
      format.json { head :no_content }
    end
  end
end
