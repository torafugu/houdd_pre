class MoretinymobtrailsController < ApplicationController
  # GET /moretinymobtrails
  # GET /moretinymobtrails.json
  def index
    @moretinymobtrails = Moretinymobtrail.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @moretinymobtrails }
    end
  end

  # GET /moretinymobtrails/1
  # GET /moretinymobtrails/1.json
  def show
    @moretinymobtrail = Moretinymobtrail.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @moretinymobtrail }
    end
  end

  # GET /moretinymobtrails/new
  # GET /moretinymobtrails/new.json
  def new
    @moretinymobtrail = Moretinymobtrail.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @moretinymobtrail }
    end
  end

  # GET /moretinymobtrails/1/edit
  def edit
    @moretinymobtrail = Moretinymobtrail.find(params[:id])
  end

  # POST /moretinymobtrails
  # POST /moretinymobtrails.json
  def create
    @moretinymobtrail = Moretinymobtrail.new(params[:moretinymobtrail])

    respond_to do |format|
      if @moretinymobtrail.save
        format.html { redirect_to @moretinymobtrail, notice: 'Moretinymobtrail was successfully created.' }
        format.json { render json: @moretinymobtrail, status: :created, location: @moretinymobtrail }
      else
        format.html { render action: "new" }
        format.json { render json: @moretinymobtrail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /moretinymobtrails/1
  # PUT /moretinymobtrails/1.json
  def update
    @moretinymobtrail = Moretinymobtrail.find(params[:id])

    respond_to do |format|
      if @moretinymobtrail.update_attributes(params[:moretinymobtrail])
        format.html { redirect_to @moretinymobtrail, notice: 'Moretinymobtrail was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @moretinymobtrail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /moretinymobtrails/1
  # DELETE /moretinymobtrails/1.json
  def destroy
    @moretinymobtrail = Moretinymobtrail.find(params[:id])
    @moretinymobtrail.destroy

    respond_to do |format|
      format.html { redirect_to moretinymobtrails_url }
      format.json { head :no_content }
    end
  end
end
