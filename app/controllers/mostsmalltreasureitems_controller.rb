class MostsmalltreasureitemsController < ApplicationController
  # GET /mostsmalltreasureitems
  # GET /mostsmalltreasureitems.json
  def index
    @mostsmalltreasureitems = Mostsmalltreasureitem.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mostsmalltreasureitems }
    end
  end

  # GET /mostsmalltreasureitems/1
  # GET /mostsmalltreasureitems/1.json
  def show
    @mostsmalltreasureitem = Mostsmalltreasureitem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mostsmalltreasureitem }
    end
  end

  # GET /mostsmalltreasureitems/new
  # GET /mostsmalltreasureitems/new.json
  def new
    @mostsmalltreasureitem = Mostsmalltreasureitem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mostsmalltreasureitem }
    end
  end

  # GET /mostsmalltreasureitems/1/edit
  def edit
    @mostsmalltreasureitem = Mostsmalltreasureitem.find(params[:id])
  end

  # POST /mostsmalltreasureitems
  # POST /mostsmalltreasureitems.json
  def create
    @mostsmalltreasureitem = Mostsmalltreasureitem.new(params[:mostsmalltreasureitem])

    respond_to do |format|
      if @mostsmalltreasureitem.save
        format.html { redirect_to @mostsmalltreasureitem, notice: 'Mostsmalltreasureitem was successfully created.' }
        format.json { render json: @mostsmalltreasureitem, status: :created, location: @mostsmalltreasureitem }
      else
        format.html { render action: "new" }
        format.json { render json: @mostsmalltreasureitem.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mostsmalltreasureitems/1
  # PUT /mostsmalltreasureitems/1.json
  def update
    @mostsmalltreasureitem = Mostsmalltreasureitem.find(params[:id])

    respond_to do |format|
      if @mostsmalltreasureitem.update_attributes(params[:mostsmalltreasureitem])
        format.html { redirect_to @mostsmalltreasureitem, notice: 'Mostsmalltreasureitem was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mostsmalltreasureitem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mostsmalltreasureitems/1
  # DELETE /mostsmalltreasureitems/1.json
  def destroy
    @mostsmalltreasureitem = Mostsmalltreasureitem.find(params[:id])
    @mostsmalltreasureitem.destroy

    respond_to do |format|
      format.html { redirect_to mostsmalltreasureitems_url }
      format.json { head :no_content }
    end
  end
end
