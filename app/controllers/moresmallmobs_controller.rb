class MoresmallmobsController < ApplicationController
  # GET /moresmallmobs
  # GET /moresmallmobs.json
  def index
    @moresmallmobs = Moresmallmob.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @moresmallmobs }
    end
  end

  # GET /moresmallmobs/1
  # GET /moresmallmobs/1.json
  def show
    @moresmallmob = Moresmallmob.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @moresmallmob }
    end
  end

  # GET /moresmallmobs/new
  # GET /moresmallmobs/new.json
  def new
    @moresmallmob = Moresmallmob.new
    @moresmallmob.moresmallarmorinventories.build
    @moresmallmob.moresmallweponinventories.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @moresmallmob }
    end
  end

  # GET /moresmallmobs/1/edit
  def edit
    @moresmallmob = Moresmallmob.find(params[:id])
    @moresmallmob.moresmallarmorinventories.build if @moresmallmob.moresmallarmorinventories.blank?
    @moresmallmob.moresmallweponinventories.build if @moresmallmob.moresmallweponinventories.blank?
  end

  # POST /moresmallmobs
  # POST /moresmallmobs.json
  def create
    @moresmallmob = Moresmallmob.new(params[:moresmallmob])

    respond_to do |format|
      if @moresmallmob.save
        format.html { redirect_to @moresmallmob, notice: 'Moresmallmob was successfully created.' }
        format.json { render json: @moresmallmob, status: :created, location: @moresmallmob }
      else
        format.html { render action: "new" }
        format.json { render json: @moresmallmob.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /moresmallmobs/1
  # PUT /moresmallmobs/1.json
  def update
    @moresmallmob = Moresmallmob.find(params[:id])

    respond_to do |format|
      if @moresmallmob.update_attributes(params[:moresmallmob])
        format.html { redirect_to @moresmallmob, notice: 'Moresmallmob was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @moresmallmob.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /moresmallmobs/1
  # DELETE /moresmallmobs/1.json
  def destroy
    @moresmallmob = Moresmallmob.find(params[:id])
    @moresmallmob.destroy

    respond_to do |format|
      format.html { redirect_to moresmallmobs_url }
      format.json { head :no_content }
    end
  end

  # GET /moresmallmobs/select_squad
  # GET /moresmallmobs/1/select_squad
  def select_squad
    @squads = Moresmallmobsquad.find_all_by_moresmalluser_id(params[:user_id]).collect{|s| [s.name, s.id]}
    @squads.unshift(["", 0])
    @selected_squad = Moresmallmob.find(params[:id]).moresmallmobsquad_id unless params[:id].blank?
    render
  end
end
