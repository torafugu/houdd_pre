class MostsmallterrainproductsController < ApplicationController
  # GET /mostsmallterrainproducts
  # GET /mostsmallterrainproducts.json
  def index
    @mostsmallterrainproducts = Mostsmallterrainproduct.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mostsmallterrainproducts }
    end
  end

  # GET /mostsmallterrainproducts/1
  # GET /mostsmallterrainproducts/1.json
  def show
    @mostsmallterrainproduct = Mostsmallterrainproduct.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mostsmallterrainproduct }
    end
  end

  # GET /mostsmallterrainproducts/new
  # GET /mostsmallterrainproducts/new.json
  def new
    @mostsmallterrainproduct = Mostsmallterrainproduct.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mostsmallterrainproduct }
    end
  end

  # GET /mostsmallterrainproducts/1/edit
  def edit
    @mostsmallterrainproduct = Mostsmallterrainproduct.find(params[:id])
  end

  # POST /mostsmallterrainproducts
  # POST /mostsmallterrainproducts.json
  def create
    @mostsmallterrainproduct = Mostsmallterrainproduct.new(params[:mostsmallterrainproduct])

    respond_to do |format|
      if @mostsmallterrainproduct.save
        format.html { redirect_to @mostsmallterrainproduct, notice: 'Mostsmallterrainproduct was successfully created.' }
        format.json { render json: @mostsmallterrainproduct, status: :created, location: @mostsmallterrainproduct }
      else
        format.html { render action: "new" }
        format.json { render json: @mostsmallterrainproduct.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mostsmallterrainproducts/1
  # PUT /mostsmallterrainproducts/1.json
  def update
    @mostsmallterrainproduct = Mostsmallterrainproduct.find(params[:id])

    respond_to do |format|
      if @mostsmallterrainproduct.update_attributes(params[:mostsmallterrainproduct])
        format.html { redirect_to @mostsmallterrainproduct, notice: 'Mostsmallterrainproduct was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mostsmallterrainproduct.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mostsmallterrainproducts/1
  # DELETE /mostsmallterrainproducts/1.json
  def destroy
    @mostsmallterrainproduct = Mostsmallterrainproduct.find(params[:id])
    @mostsmallterrainproduct.destroy

    respond_to do |format|
      format.html { redirect_to mostsmallterrainproducts_url }
      format.json { head :no_content }
    end
  end
end
