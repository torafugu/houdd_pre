class MostsmallskillsController < ApplicationController
  # GET /mostsmallskills
  # GET /mostsmallskills.json
  def index
    @mostsmallskills = Mostsmallskill.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mostsmallskills }
    end
  end

  # GET /mostsmallskills/1
  # GET /mostsmallskills/1.json
  def show
    @mostsmallskill = Mostsmallskill.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mostsmallskill }
    end
  end

  # GET /mostsmallskills/new
  # GET /mostsmallskills/new.json
  def new
    @mostsmallskill = Mostsmallskill.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mostsmallskill }
    end
  end

  # GET /mostsmallskills/1/edit
  def edit
    @mostsmallskill = Mostsmallskill.find(params[:id])
  end

  # POST /mostsmallskills
  # POST /mostsmallskills.json
  def create
    @mostsmallskill = Mostsmallskill.new(params[:mostsmallskill])

    respond_to do |format|
      if @mostsmallskill.save
        format.html { redirect_to @mostsmallskill, notice: 'Mostsmallskill was successfully created.' }
        format.json { render json: @mostsmallskill, status: :created, location: @mostsmallskill }
      else
        format.html { render action: "new" }
        format.json { render json: @mostsmallskill.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mostsmallskills/1
  # PUT /mostsmallskills/1.json
  def update
    @mostsmallskill = Mostsmallskill.find(params[:id])

    respond_to do |format|
      if @mostsmallskill.update_attributes(params[:mostsmallskill])
        format.html { redirect_to @mostsmallskill, notice: 'Mostsmallskill was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mostsmallskill.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mostsmallskills/1
  # DELETE /mostsmallskills/1.json
  def destroy
    @mostsmallskill = Mostsmallskill.find(params[:id])
    @mostsmallskill.destroy

    respond_to do |format|
      format.html { redirect_to mostsmallskills_url }
      format.json { head :no_content }
    end
  end
end
