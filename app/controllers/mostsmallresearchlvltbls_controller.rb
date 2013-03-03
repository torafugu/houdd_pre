class MostsmallresearchlvltblsController < ApplicationController
  # GET /mostsmallresearchlvltbls
  # GET /mostsmallresearchlvltbls.json
  def index
    @mostsmallresearchlvltbls = Mostsmallresearchlvltbl.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mostsmallresearchlvltbls }
    end
  end

  # GET /mostsmallresearchlvltbls/1
  # GET /mostsmallresearchlvltbls/1.json
  def show
    @mostsmallresearchlvltbl = Mostsmallresearchlvltbl.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mostsmallresearchlvltbl }
    end
  end

  # GET /mostsmallresearchlvltbls/new
  # GET /mostsmallresearchlvltbls/new.json
  def new
    @mostsmallresearchlvltbl = Mostsmallresearchlvltbl.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mostsmallresearchlvltbl }
    end
  end

  # GET /mostsmallresearchlvltbls/1/edit
  def edit
    @mostsmallresearchlvltbl = Mostsmallresearchlvltbl.find(params[:id])
  end

  # POST /mostsmallresearchlvltbls
  # POST /mostsmallresearchlvltbls.json
  def create
    @mostsmallresearchlvltbl = Mostsmallresearchlvltbl.new(params[:mostsmallresearchlvltbl])

    respond_to do |format|
      if @mostsmallresearchlvltbl.save
        format.html { redirect_to @mostsmallresearchlvltbl, notice: 'Mostsmallresearchlvltbl was successfully created.' }
        format.json { render json: @mostsmallresearchlvltbl, status: :created, location: @mostsmallresearchlvltbl }
      else
        format.html { render action: "new" }
        format.json { render json: @mostsmallresearchlvltbl.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mostsmallresearchlvltbls/1
  # PUT /mostsmallresearchlvltbls/1.json
  def update
    @mostsmallresearchlvltbl = Mostsmallresearchlvltbl.find(params[:id])

    respond_to do |format|
      if @mostsmallresearchlvltbl.update_attributes(params[:mostsmallresearchlvltbl])
        format.html { redirect_to @mostsmallresearchlvltbl, notice: 'Mostsmallresearchlvltbl was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mostsmallresearchlvltbl.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mostsmallresearchlvltbls/1
  # DELETE /mostsmallresearchlvltbls/1.json
  def destroy
    @mostsmallresearchlvltbl = Mostsmallresearchlvltbl.find(params[:id])
    @mostsmallresearchlvltbl.destroy

    respond_to do |format|
      format.html { redirect_to mostsmallresearchlvltbls_url }
      format.json { head :no_content }
    end
  end
end
