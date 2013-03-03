class MostsmallskillcategoriesController < ApplicationController
  # GET /mostsmallskillcategories
  # GET /mostsmallskillcategories.json
  def index
    @mostsmallskillcategories = Mostsmallskillcategory.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mostsmallskillcategories }
    end
  end

  # GET /mostsmallskillcategories/1
  # GET /mostsmallskillcategories/1.json
  def show
    @mostsmallskillcategory = Mostsmallskillcategory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mostsmallskillcategory }
    end
  end

  # GET /mostsmallskillcategories/new
  # GET /mostsmallskillcategories/new.json
  def new
    @mostsmallskillcategory = Mostsmallskillcategory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mostsmallskillcategory }
    end
  end

  # GET /mostsmallskillcategories/1/edit
  def edit
    @mostsmallskillcategory = Mostsmallskillcategory.find(params[:id])
  end

  # POST /mostsmallskillcategories
  # POST /mostsmallskillcategories.json
  def create
    @mostsmallskillcategory = Mostsmallskillcategory.new(params[:mostsmallskillcategory])

    respond_to do |format|
      if @mostsmallskillcategory.save
        format.html { redirect_to @mostsmallskillcategory, notice: 'Mostsmallskillcategory was successfully created.' }
        format.json { render json: @mostsmallskillcategory, status: :created, location: @mostsmallskillcategory }
      else
        format.html { render action: "new" }
        format.json { render json: @mostsmallskillcategory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mostsmallskillcategories/1
  # PUT /mostsmallskillcategories/1.json
  def update
    @mostsmallskillcategory = Mostsmallskillcategory.find(params[:id])

    respond_to do |format|
      if @mostsmallskillcategory.update_attributes(params[:mostsmallskillcategory])
        format.html { redirect_to @mostsmallskillcategory, notice: 'Mostsmallskillcategory was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mostsmallskillcategory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mostsmallskillcategories/1
  # DELETE /mostsmallskillcategories/1.json
  def destroy
    @mostsmallskillcategory = Mostsmallskillcategory.find(params[:id])
    @mostsmallskillcategory.destroy

    respond_to do |format|
      format.html { redirect_to mostsmallskillcategories_url }
      format.json { head :no_content }
    end
  end
end
