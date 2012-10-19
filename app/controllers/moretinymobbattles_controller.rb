class MoretinymobbattlesController < ApplicationController
  # GET /moretinymobbattles
  # GET /moretinymobbattles.json
  def index
    @moretinymobbattles = Moretinymobbattle.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @moretinymobbattles }
    end
  end

  # GET /moretinymobbattles/1
  # GET /moretinymobbattles/1.json
  def show
    @moretinymobbattle = Moretinymobbattle.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @moretinymobbattle }
    end
  end

  # GET /moretinymobbattles/new
  # GET /moretinymobbattles/new.json
  def new
    @moretinymobbattle = Moretinymobbattle.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @moretinymobbattle }
    end
  end

  # GET /moretinymobbattles/1/edit
  def edit
    @moretinymobbattle = Moretinymobbattle.find(params[:id])
  end

  # POST /moretinymobbattles
  # POST /moretinymobbattles.json
  def create
    @moretinymobbattle = Moretinymobbattle.new(params[:moretinymobbattle])

    respond_to do |format|
      if @moretinymobbattle.save
        format.html { redirect_to @moretinymobbattle, notice: 'Moretinymobbattle was successfully created.' }
        format.json { render json: @moretinymobbattle, status: :created, location: @moretinymobbattle }
      else
        format.html { render action: "new" }
        format.json { render json: @moretinymobbattle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /moretinymobbattles/1
  # PUT /moretinymobbattles/1.json
  def update
    @moretinymobbattle = Moretinymobbattle.find(params[:id])

    respond_to do |format|
      if @moretinymobbattle.update_attributes(params[:moretinymobbattle])
        format.html { redirect_to @moretinymobbattle, notice: 'Moretinymobbattle was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @moretinymobbattle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /moretinymobbattles/1
  # DELETE /moretinymobbattles/1.json
  def destroy
    @moretinymobbattle = Moretinymobbattle.find(params[:id])
    @moretinymobbattle.destroy

    respond_to do |format|
      format.html { redirect_to moretinymobbattles_url }
      format.json { head :no_content }
    end
  end
end
