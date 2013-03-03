class MostsmallconstproductsController < ApplicationController
  # GET /mostsmallconstproducts
  # GET /mostsmallconstproducts.json
  def index
    @mostsmallconstproducts = Mostsmallconstproduct.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mostsmallconstproducts }
    end
  end

  # GET /mostsmallconstproducts/1
  # GET /mostsmallconstproducts/1.json
  def show
    @mostsmallconstproduct = Mostsmallconstproduct.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mostsmallconstproduct }
    end
  end

  # GET /mostsmallconstproducts/new
  # GET /mostsmallconstproducts/new.json
  def new
    @mostsmallconstproduct = Mostsmallconstproduct.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mostsmallconstproduct }
    end
  end

  # GET /mostsmallconstproducts/1/edit
  def edit
    @mostsmallconstproduct = Mostsmallconstproduct.find(params[:id])
  end

  # POST /mostsmallconstproducts
  # POST /mostsmallconstproducts.json
  def create
    @mostsmallconstproduct = Mostsmallconstproduct.new(params[:mostsmallconstproduct])

    respond_to do |format|
      if @mostsmallconstproduct.save
        format.html { redirect_to @mostsmallconstproduct, notice: 'Mostsmallconstproduct was successfully created.' }
        format.json { render json: @mostsmallconstproduct, status: :created, location: @mostsmallconstproduct }
      else
        format.html { render action: "new" }
        format.json { render json: @mostsmallconstproduct.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mostsmallconstproducts/1
  # PUT /mostsmallconstproducts/1.json
  def update
    @mostsmallconstproduct = Mostsmallconstproduct.find(params[:id])

    respond_to do |format|
      if @mostsmallconstproduct.update_attributes(params[:mostsmallconstproduct])
        format.html { redirect_to @mostsmallconstproduct, notice: 'Mostsmallconstproduct was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mostsmallconstproduct.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mostsmallconstproducts/1
  # DELETE /mostsmallconstproducts/1.json
  def destroy
    @mostsmallconstproduct = Mostsmallconstproduct.find(params[:id])
    @mostsmallconstproduct.destroy

    respond_to do |format|
      format.html { redirect_to mostsmallconstproducts_url }
      format.json { head :no_content }
    end
  end
end
