class MediumFamiliesController < ApplicationController
  # GET /medium_families
  # GET /medium_families.json
  def index
    @medium_families = MediumFamily.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @medium_families }
    end
  end

  # GET /medium_families/1
  # GET /medium_families/1.json
  def show
    @medium_family = MediumFamily.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @medium_family }
    end
  end

  # GET /medium_families/new
  # GET /medium_families/new.json
  def new
    @medium_family = MediumFamily.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @medium_family }
    end
  end

  # GET /medium_families/1/edit
  def edit
    @medium_family = MediumFamily.find(params[:id])
  end

  # POST /medium_families
  # POST /medium_families.json
  def create
    @medium_family = MediumFamily.new(params[:medium_family])

    respond_to do |format|
      if @medium_family.save
        format.html { redirect_to @medium_family, notice: 'Medium family was successfully created.' }
        format.json { render json: @medium_family, status: :created, location: @medium_family }
      else
        format.html { render action: "new" }
        format.json { render json: @medium_family.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /medium_families/1
  # PUT /medium_families/1.json
  def update
    @medium_family = MediumFamily.find(params[:id])

    respond_to do |format|
      if @medium_family.update_attributes(params[:medium_family])
        format.html { redirect_to @medium_family, notice: 'Medium family was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @medium_family.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /medium_families/1
  # DELETE /medium_families/1.json
  def destroy
    @medium_family = MediumFamily.find(params[:id])
    @medium_family.destroy

    respond_to do |format|
      format.html { redirect_to medium_families_url }
      format.json { head :no_content }
    end
  end
end
