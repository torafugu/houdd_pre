class MosttinymobtrailsController < ApplicationController
  # GET /mosttinymobtrails
  # GET /mosttinymobtrails.json
  def index
    @mosttinymobtrails = Mosttinymobtrail.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mosttinymobtrails }
    end
  end

  # GET /mosttinymobtrails/1
  # GET /mosttinymobtrails/1.json
  def show
    @mosttinymobtrail = Mosttinymobtrail.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mosttinymobtrail }
    end
  end

  # GET /mosttinymobtrails/new
  # GET /mosttinymobtrails/new.json
  def new
    @mosttinymobtrail = Mosttinymobtrail.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mosttinymobtrail }
    end
  end

  # GET /mosttinymobtrails/1/edit
  def edit
    @mosttinymobtrail = Mosttinymobtrail.find(params[:id])
  end

  # POST /mosttinymobtrails
  # POST /mosttinymobtrails.json
  def create
    @mosttinymobtrail = Mosttinymobtrail.new(params[:mosttinymobtrail])

    respond_to do |format|
      if @mosttinymobtrail.save
        format.html { redirect_to @mosttinymobtrail, notice: 'Mosttinymobtrail was successfully created.' }
        format.json { render json: @mosttinymobtrail, status: :created, location: @mosttinymobtrail }
      else
        format.html { render action: "new" }
        format.json { render json: @mosttinymobtrail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mosttinymobtrails/1
  # PUT /mosttinymobtrails/1.json
  def update
    @mosttinymobtrail = Mosttinymobtrail.find(params[:id])

    respond_to do |format|
      if @mosttinymobtrail.update_attributes(params[:mosttinymobtrail])
        format.html { redirect_to @mosttinymobtrail, notice: 'Mosttinymobtrail was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mosttinymobtrail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mosttinymobtrails/1
  # DELETE /mosttinymobtrails/1.json
  def destroy
    @mosttinymobtrail = Mosttinymobtrail.find(params[:id])
    @mosttinymobtrail.destroy

    respond_to do |format|
      format.html { redirect_to mosttinymobtrails_url }
      format.json { head :no_content }
    end
  end
end
