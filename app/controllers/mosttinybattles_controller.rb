class MosttinybattlesController < ApplicationController
  # GET /mosttinybattles
  # GET /mosttinybattles.json
  def index
    @mosttinybattles = Mosttinybattle.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mosttinybattles }
    end
  end

  # GET /mosttinybattles/1
  # GET /mosttinybattles/1.json
  def show
    @mosttinybattle = Mosttinybattle.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mosttinybattle }
    end
  end

  # GET /mosttinybattles/new
  # GET /mosttinybattles/new.json
  def new
    @mosttinybattle = Mosttinybattle.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mosttinybattle }
    end
  end

  # GET /mosttinybattles/1/edit
  def edit
    @mosttinybattle = Mosttinybattle.find(params[:id])
  end

  # POST /mosttinybattles
  # POST /mosttinybattles.json
  def create
    @mosttinybattle = Mosttinybattle.new(params[:mosttinybattle])

    respond_to do |format|
      if @mosttinybattle.save
        format.html { redirect_to @mosttinybattle, notice: 'Mosttinybattle was successfully created.' }
        format.json { render json: @mosttinybattle, status: :created, location: @mosttinybattle }
      else
        format.html { render action: "new" }
        format.json { render json: @mosttinybattle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mosttinybattles/1
  # PUT /mosttinybattles/1.json
  def update
    @mosttinybattle = Mosttinybattle.find(params[:id])

    respond_to do |format|
      if @mosttinybattle.update_attributes(params[:mosttinybattle])
        format.html { redirect_to @mosttinybattle, notice: 'Mosttinybattle was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mosttinybattle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mosttinybattles/1
  # DELETE /mosttinybattles/1.json
  def destroy
    @mosttinybattle = Mosttinybattle.find(params[:id])
    @mosttinybattle.destroy

    respond_to do |format|
      format.html { redirect_to mosttinybattles_url }
      format.json { head :no_content }
    end
  end
end
