class MostsmallmissioncategoriesController < ApplicationController
  # GET /mostsmallmissioncategories
  # GET /mostsmallmissioncategories.json
  def index
    @mostsmallmissioncategories = Mostsmallmissioncategory.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mostsmallmissioncategories }
    end
  end

  # GET /mostsmallmissioncategories/1
  # GET /mostsmallmissioncategories/1.json
  def show
    @mostsmallmissioncategory = Mostsmallmissioncategory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mostsmallmissioncategory }
    end
  end

  # GET /mostsmallmissioncategories/new
  # GET /mostsmallmissioncategories/new.json
  def new
    @mostsmallmissioncategory = Mostsmallmissioncategory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mostsmallmissioncategory }
    end
  end

  # GET /mostsmallmissioncategories/1/edit
  def edit
    @mostsmallmissioncategory = Mostsmallmissioncategory.find(params[:id])
  end

  # POST /mostsmallmissioncategories
  # POST /mostsmallmissioncategories.json
  def create
    @mostsmallmissioncategory = Mostsmallmissioncategory.new(params[:mostsmallmissioncategory])

    respond_to do |format|
      if @mostsmallmissioncategory.save
        format.html { redirect_to @mostsmallmissioncategory, notice: 'Mostsmallmissioncategory was successfully created.' }
        format.json { render json: @mostsmallmissioncategory, status: :created, location: @mostsmallmissioncategory }
      else
        format.html { render action: "new" }
        format.json { render json: @mostsmallmissioncategory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mostsmallmissioncategories/1
  # PUT /mostsmallmissioncategories/1.json
  def update
    @mostsmallmissioncategory = Mostsmallmissioncategory.find(params[:id])

    respond_to do |format|
      if @mostsmallmissioncategory.update_attributes(params[:mostsmallmissioncategory])
        format.html { redirect_to @mostsmallmissioncategory, notice: 'Mostsmallmissioncategory was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mostsmallmissioncategory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mostsmallmissioncategories/1
  # DELETE /mostsmallmissioncategories/1.json
  def destroy
    @mostsmallmissioncategory = Mostsmallmissioncategory.find(params[:id])
    @mostsmallmissioncategory.destroy

    respond_to do |format|
      format.html { redirect_to mostsmallmissioncategories_url }
      format.json { head :no_content }
    end
  end
end
