class MostsmallmissionsController < ApplicationController
  # GET /mostsmallmissions
  # GET /mostsmallmissions.json
  def index
    @mostsmallmissions = Mostsmallmission.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mostsmallmissions }
    end
  end

  # GET /mostsmallmissions/1
  # GET /mostsmallmissions/1.json
  def show
    @mostsmallmission = Mostsmallmission.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mostsmallmission }
    end
  end

  # GET /mostsmallmissions/new
  # GET /mostsmallmissions/new.json
  def new
    @mostsmallmission = Mostsmallmission.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mostsmallmission }
    end
  end

  # GET /mostsmallmissions/1/edit
  def edit
    @mostsmallmission = Mostsmallmission.find(params[:id])
  end

  # POST /mostsmallmissions
  # POST /mostsmallmissions.json
  def create
    @mostsmallmission = Mostsmallmission.new(params[:mostsmallmission])

    respond_to do |format|
      if @mostsmallmission.save
        format.html { redirect_to @mostsmallmission, notice: 'Mostsmallmission was successfully created.' }
        format.json { render json: @mostsmallmission, status: :created, location: @mostsmallmission }
      else
        format.html { render action: "new" }
        format.json { render json: @mostsmallmission.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mostsmallmissions/1
  # PUT /mostsmallmissions/1.json
  def update
    @mostsmallmission = Mostsmallmission.find(params[:id])

    respond_to do |format|
      if @mostsmallmission.update_attributes(params[:mostsmallmission])
        format.html { redirect_to @mostsmallmission, notice: 'Mostsmallmission was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mostsmallmission.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mostsmallmissions/1
  # DELETE /mostsmallmissions/1.json
  def destroy
    @mostsmallmission = Mostsmallmission.find(params[:id])
    @mostsmallmission.destroy

    respond_to do |format|
      format.html { redirect_to mostsmallmissions_url }
      format.json { head :no_content }
    end
  end
end
