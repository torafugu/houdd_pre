class MosttinystrategiesController < ApplicationController
  # GET /mosttinystrategies
  # GET /mosttinystrategies.json
  def index
    @mosttinystrategies = Mosttinystrategy.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mosttinystrategies }
    end
  end

  # GET /mosttinystrategies/1
  # GET /mosttinystrategies/1.json
  def show
    @mosttinystrategy = Mosttinystrategy.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mosttinystrategy }
    end
  end

  # GET /mosttinystrategies/new
  # GET /mosttinystrategies/new.json
  def new
    @mosttinystrategy = Mosttinystrategy.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mosttinystrategy }
    end
  end

  # GET /mosttinystrategies/1/edit
  def edit
    @mosttinystrategy = Mosttinystrategy.find(params[:id])
  end

  # POST /mosttinystrategies
  # POST /mosttinystrategies.json
  def create
    @mosttinystrategy = Mosttinystrategy.new(params[:mosttinystrategy])

    respond_to do |format|
      if @mosttinystrategy.save
        format.html { redirect_to @mosttinystrategy, notice: 'Mosttinystrategy was successfully created.' }
        format.json { render json: @mosttinystrategy, status: :created, location: @mosttinystrategy }
      else
        format.html { render action: "new" }
        format.json { render json: @mosttinystrategy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mosttinystrategies/1
  # PUT /mosttinystrategies/1.json
  def update
    @mosttinystrategy = Mosttinystrategy.find(params[:id])

    respond_to do |format|
      if @mosttinystrategy.update_attributes(params[:mosttinystrategy])
        format.html { redirect_to @mosttinystrategy, notice: 'Mosttinystrategy was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mosttinystrategy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mosttinystrategies/1
  # DELETE /mosttinystrategies/1.json
  def destroy
    @mosttinystrategy = Mosttinystrategy.find(params[:id])
    @mosttinystrategy.destroy

    respond_to do |format|
      format.html { redirect_to mosttinystrategies_url }
      format.json { head :no_content }
    end
  end
end
