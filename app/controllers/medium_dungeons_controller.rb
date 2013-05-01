class MediumDungeonsController < ApplicationController
  # GET /medium_dungeons
  # GET /medium_dungeons.json
  def index
    @medium_dungeons = MediumDungeon.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @medium_dungeons }
    end
  end

  # GET /medium_dungeons/1
  # GET /medium_dungeons/1.json
  def show
    @medium_dungeon = MediumDungeon.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @medium_dungeon }
    end
  end

  # GET /medium_dungeons/new
  # GET /medium_dungeons/new.json
  def new
    @medium_dungeon = MediumDungeon.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @medium_dungeon }
    end
  end

  # GET /medium_dungeons/1/edit
  def edit
    @medium_dungeon = MediumDungeon.find(params[:id])
  end

  # POST /medium_dungeons
  # POST /medium_dungeons.json
  def create
    @medium_dungeon = MediumDungeon.new(params[:medium_dungeon])

    respond_to do |format|
      if @medium_dungeon.save
        format.html { redirect_to @medium_dungeon, notice: 'Medium dungeon was successfully created.' }
        format.json { render json: @medium_dungeon, status: :created, location: @medium_dungeon }
      else
        format.html { render action: "new" }
        format.json { render json: @medium_dungeon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /medium_dungeons/1
  # PUT /medium_dungeons/1.json
  def update
    @medium_dungeon = MediumDungeon.find(params[:id])

    respond_to do |format|
      if @medium_dungeon.update_attributes(params[:medium_dungeon])
        format.html { redirect_to @medium_dungeon, notice: 'Medium dungeon was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @medium_dungeon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /medium_dungeons/1
  # DELETE /medium_dungeons/1.json
  def destroy
    @medium_dungeon = MediumDungeon.find(params[:id])
    @medium_dungeon.destroy

    respond_to do |format|
      format.html { redirect_to medium_dungeons_url }
      format.json { head :no_content }
    end
  end
end
