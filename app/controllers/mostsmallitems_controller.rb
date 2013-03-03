class MostsmallitemsController < ApplicationController
  # GET /mostsmallitems
  # GET /mostsmallitems.json
  def index
    @mostsmallitems = Mostsmallitem.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mostsmallitems }
    end
  end

  # GET /mostsmallitems/1
  # GET /mostsmallitems/1.json
  def show
    @mostsmallitem = Mostsmallitem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mostsmallitem }
    end
  end

  # GET /mostsmallitems/new
  # GET /mostsmallitems/new.json
  def new
    @mostsmallitem = Mostsmallitem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mostsmallitem }
    end
  end

  # GET /mostsmallitems/1/edit
  def edit
    @mostsmallitem = Mostsmallitem.find(params[:id])
  end

  # POST /mostsmallitems
  # POST /mostsmallitems.json
  def create
    @mostsmallitem = Mostsmallitem.new(params[:mostsmallitem])

    respond_to do |format|
      if @mostsmallitem.save
        format.html { redirect_to @mostsmallitem, notice: 'Mostsmallitem was successfully created.' }
        format.json { render json: @mostsmallitem, status: :created, location: @mostsmallitem }
      else
        format.html { render action: "new" }
        format.json { render json: @mostsmallitem.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mostsmallitems/1
  # PUT /mostsmallitems/1.json
  def update
    @mostsmallitem = Mostsmallitem.find(params[:id])

    respond_to do |format|
      if @mostsmallitem.update_attributes(params[:mostsmallitem])
        format.html { redirect_to @mostsmallitem, notice: 'Mostsmallitem was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mostsmallitem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mostsmallitems/1
  # DELETE /mostsmallitems/1.json
  def destroy
    @mostsmallitem = Mostsmallitem.find(params[:id])
    @mostsmallitem.destroy

    respond_to do |format|
      format.html { redirect_to mostsmallitems_url }
      format.json { head :no_content }
    end
  end
end
