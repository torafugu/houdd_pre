class MostsmallskilllvltblsController < ApplicationController
  # GET /mostsmallskilllvltbls
  # GET /mostsmallskilllvltbls.json
  def index
    @mostsmallskilllvltbls = Mostsmallskilllvltbl.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mostsmallskilllvltbls }
    end
  end

  # GET /mostsmallskilllvltbls/1
  # GET /mostsmallskilllvltbls/1.json
  def show
    @mostsmallskilllvltbl = Mostsmallskilllvltbl.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mostsmallskilllvltbl }
    end
  end

  # GET /mostsmallskilllvltbls/new
  # GET /mostsmallskilllvltbls/new.json
  def new
    @mostsmallskilllvltbl = Mostsmallskilllvltbl.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mostsmallskilllvltbl }
    end
  end

  # GET /mostsmallskilllvltbls/1/edit
  def edit
    @mostsmallskilllvltbl = Mostsmallskilllvltbl.find(params[:id])
  end

  # POST /mostsmallskilllvltbls
  # POST /mostsmallskilllvltbls.json
  def create
    @mostsmallskilllvltbl = Mostsmallskilllvltbl.new(params[:mostsmallskilllvltbl])

    respond_to do |format|
      if @mostsmallskilllvltbl.save
        format.html { redirect_to @mostsmallskilllvltbl, notice: 'Mostsmallskilllvltbl was successfully created.' }
        format.json { render json: @mostsmallskilllvltbl, status: :created, location: @mostsmallskilllvltbl }
      else
        format.html { render action: "new" }
        format.json { render json: @mostsmallskilllvltbl.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mostsmallskilllvltbls/1
  # PUT /mostsmallskilllvltbls/1.json
  def update
    @mostsmallskilllvltbl = Mostsmallskilllvltbl.find(params[:id])

    respond_to do |format|
      if @mostsmallskilllvltbl.update_attributes(params[:mostsmallskilllvltbl])
        format.html { redirect_to @mostsmallskilllvltbl, notice: 'Mostsmallskilllvltbl was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mostsmallskilllvltbl.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mostsmallskilllvltbls/1
  # DELETE /mostsmallskilllvltbls/1.json
  def destroy
    @mostsmallskilllvltbl = Mostsmallskilllvltbl.find(params[:id])
    @mostsmallskilllvltbl.destroy

    respond_to do |format|
      format.html { redirect_to mostsmallskilllvltbls_url }
      format.json { head :no_content }
    end
  end
end
