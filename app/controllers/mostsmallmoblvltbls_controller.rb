class MostsmallmoblvltblsController < ApplicationController
  # GET /mostsmallmoblvltbls
  # GET /mostsmallmoblvltbls.json
  def index
    @mostsmallmoblvltbls = Mostsmallmoblvltbl.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mostsmallmoblvltbls }
    end
  end

  # GET /mostsmallmoblvltbls/1
  # GET /mostsmallmoblvltbls/1.json
  def show
    @mostsmallmoblvltbl = Mostsmallmoblvltbl.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mostsmallmoblvltbl }
    end
  end

  # GET /mostsmallmoblvltbls/new
  # GET /mostsmallmoblvltbls/new.json
  def new
    @mostsmallmoblvltbl = Mostsmallmoblvltbl.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mostsmallmoblvltbl }
    end
  end

  # GET /mostsmallmoblvltbls/1/edit
  def edit
    @mostsmallmoblvltbl = Mostsmallmoblvltbl.find(params[:id])
  end

  # POST /mostsmallmoblvltbls
  # POST /mostsmallmoblvltbls.json
  def create
    @mostsmallmoblvltbl = Mostsmallmoblvltbl.new(params[:mostsmallmoblvltbl])

    respond_to do |format|
      if @mostsmallmoblvltbl.save
        format.html { redirect_to @mostsmallmoblvltbl, notice: 'Mostsmallmoblvltbl was successfully created.' }
        format.json { render json: @mostsmallmoblvltbl, status: :created, location: @mostsmallmoblvltbl }
      else
        format.html { render action: "new" }
        format.json { render json: @mostsmallmoblvltbl.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mostsmallmoblvltbls/1
  # PUT /mostsmallmoblvltbls/1.json
  def update
    @mostsmallmoblvltbl = Mostsmallmoblvltbl.find(params[:id])

    respond_to do |format|
      if @mostsmallmoblvltbl.update_attributes(params[:mostsmallmoblvltbl])
        format.html { redirect_to @mostsmallmoblvltbl, notice: 'Mostsmallmoblvltbl was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mostsmallmoblvltbl.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mostsmallmoblvltbls/1
  # DELETE /mostsmallmoblvltbls/1.json
  def destroy
    @mostsmallmoblvltbl = Mostsmallmoblvltbl.find(params[:id])
    @mostsmallmoblvltbl.destroy

    respond_to do |format|
      format.html { redirect_to mostsmallmoblvltbls_url }
      format.json { head :no_content }
    end
  end
end
