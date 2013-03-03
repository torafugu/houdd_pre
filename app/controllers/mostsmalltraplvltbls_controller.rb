class MostsmalltraplvltblsController < ApplicationController
  # GET /mostsmalltraplvltbls
  # GET /mostsmalltraplvltbls.json
  def index
    @mostsmalltraplvltbls = Mostsmalltraplvltbl.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mostsmalltraplvltbls }
    end
  end

  # GET /mostsmalltraplvltbls/1
  # GET /mostsmalltraplvltbls/1.json
  def show
    @mostsmalltraplvltbl = Mostsmalltraplvltbl.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mostsmalltraplvltbl }
    end
  end

  # GET /mostsmalltraplvltbls/new
  # GET /mostsmalltraplvltbls/new.json
  def new
    @mostsmalltraplvltbl = Mostsmalltraplvltbl.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mostsmalltraplvltbl }
    end
  end

  # GET /mostsmalltraplvltbls/1/edit
  def edit
    @mostsmalltraplvltbl = Mostsmalltraplvltbl.find(params[:id])
  end

  # POST /mostsmalltraplvltbls
  # POST /mostsmalltraplvltbls.json
  def create
    @mostsmalltraplvltbl = Mostsmalltraplvltbl.new(params[:mostsmalltraplvltbl])

    respond_to do |format|
      if @mostsmalltraplvltbl.save
        format.html { redirect_to @mostsmalltraplvltbl, notice: 'Mostsmalltraplvltbl was successfully created.' }
        format.json { render json: @mostsmalltraplvltbl, status: :created, location: @mostsmalltraplvltbl }
      else
        format.html { render action: "new" }
        format.json { render json: @mostsmalltraplvltbl.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mostsmalltraplvltbls/1
  # PUT /mostsmalltraplvltbls/1.json
  def update
    @mostsmalltraplvltbl = Mostsmalltraplvltbl.find(params[:id])

    respond_to do |format|
      if @mostsmalltraplvltbl.update_attributes(params[:mostsmalltraplvltbl])
        format.html { redirect_to @mostsmalltraplvltbl, notice: 'Mostsmalltraplvltbl was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mostsmalltraplvltbl.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mostsmalltraplvltbls/1
  # DELETE /mostsmalltraplvltbls/1.json
  def destroy
    @mostsmalltraplvltbl = Mostsmalltraplvltbl.find(params[:id])
    @mostsmalltraplvltbl.destroy

    respond_to do |format|
      format.html { redirect_to mostsmalltraplvltbls_url }
      format.json { head :no_content }
    end
  end
end
