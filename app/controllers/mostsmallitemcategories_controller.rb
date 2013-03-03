class MostsmallitemcategoriesController < ApplicationController
  # GET /mostsmallitemcategories
  # GET /mostsmallitemcategories.json
  def index
    @mostsmallitemcategories = Mostsmallitemcategory.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mostsmallitemcategories }
    end
  end

  # GET /mostsmallitemcategories/1
  # GET /mostsmallitemcategories/1.json
  def show
    @mostsmallitemcategory = Mostsmallitemcategory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mostsmallitemcategory }
    end
  end

  # GET /mostsmallitemcategories/new
  # GET /mostsmallitemcategories/new.json
  def new
    @mostsmallitemcategory = Mostsmallitemcategory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mostsmallitemcategory }
    end
  end

  # GET /mostsmallitemcategories/1/edit
  def edit
    @mostsmallitemcategory = Mostsmallitemcategory.find(params[:id])
  end

  # POST /mostsmallitemcategories
  # POST /mostsmallitemcategories.json
  def create
    @mostsmallitemcategory = Mostsmallitemcategory.new(params[:mostsmallitemcategory])

    respond_to do |format|
      if @mostsmallitemcategory.save
        format.html { redirect_to @mostsmallitemcategory, notice: 'Mostsmallitemcategory was successfully created.' }
        format.json { render json: @mostsmallitemcategory, status: :created, location: @mostsmallitemcategory }
      else
        format.html { render action: "new" }
        format.json { render json: @mostsmallitemcategory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mostsmallitemcategories/1
  # PUT /mostsmallitemcategories/1.json
  def update
    @mostsmallitemcategory = Mostsmallitemcategory.find(params[:id])

    respond_to do |format|
      if @mostsmallitemcategory.update_attributes(params[:mostsmallitemcategory])
        format.html { redirect_to @mostsmallitemcategory, notice: 'Mostsmallitemcategory was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mostsmallitemcategory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mostsmallitemcategories/1
  # DELETE /mostsmallitemcategories/1.json
  def destroy
    @mostsmallitemcategory = Mostsmallitemcategory.find(params[:id])
    @mostsmallitemcategory.destroy

    respond_to do |format|
      format.html { redirect_to mostsmallitemcategories_url }
      format.json { head :no_content }
    end
  end
end
