class MoresmallstrategiesController < ApplicationController
  # GET /moresmallstrategies
  # GET /moresmallstrategies.json
  def index
    @moresmallstrategies = Moresmallstrategy.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @moresmallstrategies }
    end
  end

  # GET /moresmallstrategies/1
  # GET /moresmallstrategies/1.json
  def show
    @moresmallstrategy = Moresmallstrategy.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @moresmallstrategy }
    end
  end

  # GET /moresmallstrategies/new
  # GET /moresmallstrategies/new.json
  def new
    @moresmallstrategy = Moresmallstrategy.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @moresmallstrategy }
    end
  end

  # GET /moresmallstrategies/1/edit
  def edit
    @moresmallstrategy = Moresmallstrategy.find(params[:id])
  end

  # POST /moresmallstrategies
  # POST /moresmallstrategies.json
  def create
    @moresmallstrategy = Moresmallstrategy.new(params[:moresmallstrategy])

    respond_to do |format|
      if @moresmallstrategy.save
        format.html { redirect_to @moresmallstrategy, notice: 'Moresmallstrategy was successfully created.' }
        format.json { render json: @moresmallstrategy, status: :created, location: @moresmallstrategy }
      else
        format.html { render action: "new" }
        format.json { render json: @moresmallstrategy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /moresmallstrategies/1
  # PUT /moresmallstrategies/1.json
  def update
    @moresmallstrategy = Moresmallstrategy.find(params[:id])

    respond_to do |format|
      if @moresmallstrategy.update_attributes(params[:moresmallstrategy])
        format.html { redirect_to @moresmallstrategy, notice: 'Moresmallstrategy was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @moresmallstrategy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /moresmallstrategies/1
  # DELETE /moresmallstrategies/1.json
  def destroy
    @moresmallstrategy = Moresmallstrategy.find(params[:id])
    @moresmallstrategy.destroy

    respond_to do |format|
      format.html { redirect_to moresmallstrategies_url }
      format.json { head :no_content }
    end
  end
end
