class MediumBodyPartsController < ApplicationController
  # GET /medium_body_parts
  # GET /medium_body_parts.json
  def index
    @medium_body_parts = MediumBodyPart.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @medium_body_parts }
    end
  end

  # GET /medium_body_parts/1
  # GET /medium_body_parts/1.json
  def show
    @medium_body_part = MediumBodyPart.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @medium_body_part }
    end
  end

  # GET /medium_body_parts/new
  # GET /medium_body_parts/new.json
  def new
    @medium_body_part = MediumBodyPart.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @medium_body_part }
    end
  end

  # GET /medium_body_parts/1/edit
  def edit
    @medium_body_part = MediumBodyPart.find(params[:id])
  end

  # POST /medium_body_parts
  # POST /medium_body_parts.json
  def create
    @medium_body_part = MediumBodyPart.new(params[:medium_body_part])

    respond_to do |format|
      if @medium_body_part.save
        format.html { redirect_to @medium_body_part, notice: 'Medium body part was successfully created.' }
        format.json { render json: @medium_body_part, status: :created, location: @medium_body_part }
      else
        format.html { render action: "new" }
        format.json { render json: @medium_body_part.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /medium_body_parts/1
  # PUT /medium_body_parts/1.json
  def update
    @medium_body_part = MediumBodyPart.find(params[:id])

    respond_to do |format|
      if @medium_body_part.update_attributes(params[:medium_body_part])
        format.html { redirect_to @medium_body_part, notice: 'Medium body part was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @medium_body_part.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /medium_body_parts/1
  # DELETE /medium_body_parts/1.json
  def destroy
    @medium_body_part = MediumBodyPart.find(params[:id])
    @medium_body_part.destroy

    respond_to do |format|
      format.html { redirect_to medium_body_parts_url }
      format.json { head :no_content }
    end
  end
end
