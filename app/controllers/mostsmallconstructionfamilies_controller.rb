class MostsmallconstructionfamiliesController < ApplicationController
  # GET /mostsmallconstructionfamilies
  # GET /mostsmallconstructionfamilies.json
  def index
    @mostsmallconstructionfamilies = Mostsmallconstructionfamily.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mostsmallconstructionfamilies }
    end
  end

  # GET /mostsmallconstructionfamilies/1
  # GET /mostsmallconstructionfamilies/1.json
  def show
    @mostsmallconstructionfamily = Mostsmallconstructionfamily.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mostsmallconstructionfamily }
    end
  end

  # GET /mostsmallconstructionfamilies/new
  # GET /mostsmallconstructionfamilies/new.json
  def new
    @mostsmallconstructionfamily = Mostsmallconstructionfamily.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mostsmallconstructionfamily }
    end
  end

  # GET /mostsmallconstructionfamilies/1/edit
  def edit
    @mostsmallconstructionfamily = Mostsmallconstructionfamily.find(params[:id])
  end

  # POST /mostsmallconstructionfamilies
  # POST /mostsmallconstructionfamilies.json
  def create
    @mostsmallconstructionfamily = Mostsmallconstructionfamily.new(params[:mostsmallconstructionfamily])

    respond_to do |format|
      if @mostsmallconstructionfamily.save
        format.html { redirect_to @mostsmallconstructionfamily, notice: 'Mostsmallconstructionfamily was successfully created.' }
        format.json { render json: @mostsmallconstructionfamily, status: :created, location: @mostsmallconstructionfamily }
      else
        format.html { render action: "new" }
        format.json { render json: @mostsmallconstructionfamily.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mostsmallconstructionfamilies/1
  # PUT /mostsmallconstructionfamilies/1.json
  def update
    @mostsmallconstructionfamily = Mostsmallconstructionfamily.find(params[:id])

    respond_to do |format|
      if @mostsmallconstructionfamily.update_attributes(params[:mostsmallconstructionfamily])
        format.html { redirect_to @mostsmallconstructionfamily, notice: 'Mostsmallconstructionfamily was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mostsmallconstructionfamily.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mostsmallconstructionfamilies/1
  # DELETE /mostsmallconstructionfamilies/1.json
  def destroy
    @mostsmallconstructionfamily = Mostsmallconstructionfamily.find(params[:id])
    @mostsmallconstructionfamily.destroy

    respond_to do |format|
      format.html { redirect_to mostsmallconstructionfamilies_url }
      format.json { head :no_content }
    end
  end
end
