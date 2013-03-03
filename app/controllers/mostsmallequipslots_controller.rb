class MostsmallequipslotsController < ApplicationController
  # GET /mostsmallequipslots
  # GET /mostsmallequipslots.json
  def index
    @mostsmallequipslots = Mostsmallequipslot.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mostsmallequipslots }
    end
  end

  # GET /mostsmallequipslots/1
  # GET /mostsmallequipslots/1.json
  def show
    @mostsmallequipslot = Mostsmallequipslot.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mostsmallequipslot }
    end
  end

  # GET /mostsmallequipslots/new
  # GET /mostsmallequipslots/new.json
  def new
    @mostsmallequipslot = Mostsmallequipslot.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mostsmallequipslot }
    end
  end

  # GET /mostsmallequipslots/1/edit
  def edit
    @mostsmallequipslot = Mostsmallequipslot.find(params[:id])
  end

  # POST /mostsmallequipslots
  # POST /mostsmallequipslots.json
  def create
    @mostsmallequipslot = Mostsmallequipslot.new(params[:mostsmallequipslot])

    respond_to do |format|
      if @mostsmallequipslot.save
        format.html { redirect_to @mostsmallequipslot, notice: 'Mostsmallequipslot was successfully created.' }
        format.json { render json: @mostsmallequipslot, status: :created, location: @mostsmallequipslot }
      else
        format.html { render action: "new" }
        format.json { render json: @mostsmallequipslot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mostsmallequipslots/1
  # PUT /mostsmallequipslots/1.json
  def update
    @mostsmallequipslot = Mostsmallequipslot.find(params[:id])

    respond_to do |format|
      if @mostsmallequipslot.update_attributes(params[:mostsmallequipslot])
        format.html { redirect_to @mostsmallequipslot, notice: 'Mostsmallequipslot was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mostsmallequipslot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mostsmallequipslots/1
  # DELETE /mostsmallequipslots/1.json
  def destroy
    @mostsmallequipslot = Mostsmallequipslot.find(params[:id])
    @mostsmallequipslot.destroy

    respond_to do |format|
      format.html { redirect_to mostsmallequipslots_url }
      format.json { head :no_content }
    end
  end
end
