class SmallmobsController < ApplicationController
  # GET /smallmobs
  # GET /smallmobs.json
  def index
    @smallmobs = Smallmob.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @smallmobs }
    end
  end

  # GET /smallmobs/1
  # GET /smallmobs/1.json
  def show
    @smallmob = Smallmob.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @smallmob }
    end
  end

  # GET /smallmobs/new
  # GET /smallmobs/new.json
  def new
    @smallmob = Smallmob.new
    @smallmob.smallarmorinventories.build
    @smallmob.smallweponinventories.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @smallmob }
    end
  end

  # GET /smallmobs/1/edit
  def edit
    @smallmob = Smallmob.find(params[:id])
    @smallmob.smallarmorinventories.build if @smallmob.smallarmorinventories.blank?
    @smallmob.smallweponinventories.build if @smallmob.smallweponinventories.blank?
  end

  # POST /smallmobs
  # POST /smallmobs.json
  def create
    @smallmob = Smallmob.new(params[:smallmob])

    respond_to do |format|
      if @smallmob.save
        format.html { redirect_to @smallmob, notice: 'Smallmob was successfully created.' }
        format.json { render json: @smallmob, status: :created, location: @smallmob }
      else
        format.html { render action: "new" }
        format.json { render json: @smallmob.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /smallmobs/1
  # PUT /smallmobs/1.json
  def update
    @smallmob = Smallmob.find(params[:id])

    respond_to do |format|
      if @smallmob.update_attributes(params[:smallmob])
        format.html { redirect_to @smallmob, notice: 'Smallmob was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @smallmob.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /smallmobs/1
  # DELETE /smallmobs/1.json
  def destroy
    @smallmob = Smallmob.find(params[:id])
    @smallmob.destroy

    respond_to do |format|
      format.html { redirect_to smallmobs_url }
      format.json { head :no_content }
    end
  end

  # GET /smallmobs/select_squad
  # GET /smallmobs/1/select_squad
  def select_squad
    @smallsquad = Smallmobsquad.find_all_by_smalluser_id(params[:user_id])
    render
  end
end
