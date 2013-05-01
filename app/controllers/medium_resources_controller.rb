class MediumResourcesController < ApplicationController
  # GET /medium_resources
  # GET /medium_resources.json
  def index
    @medium_resources = MediumResource.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @medium_resources }
    end
  end

  # GET /medium_resources/1
  # GET /medium_resources/1.json
  def show
    @medium_resource = MediumResource.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @medium_resource }
    end
  end

  # GET /medium_resources/new
  # GET /medium_resources/new.json
  def new
    @medium_resource = MediumResource.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @medium_resource }
    end
  end

  # GET /medium_resources/1/edit
  def edit
    @medium_resource = MediumResource.find(params[:id])
  end

  # POST /medium_resources
  # POST /medium_resources.json
  def create
    @medium_resource = MediumResource.new(params[:medium_resource])

    respond_to do |format|
      if @medium_resource.save
        format.html { redirect_to @medium_resource, notice: 'Medium resource was successfully created.' }
        format.json { render json: @medium_resource, status: :created, location: @medium_resource }
      else
        format.html { render action: "new" }
        format.json { render json: @medium_resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /medium_resources/1
  # PUT /medium_resources/1.json
  def update
    @medium_resource = MediumResource.find(params[:id])

    respond_to do |format|
      if @medium_resource.update_attributes(params[:medium_resource])
        format.html { redirect_to @medium_resource, notice: 'Medium resource was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @medium_resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /medium_resources/1
  # DELETE /medium_resources/1.json
  def destroy
    @medium_resource = MediumResource.find(params[:id])
    @medium_resource.destroy

    respond_to do |format|
      format.html { redirect_to medium_resources_url }
      format.json { head :no_content }
    end
  end
end
