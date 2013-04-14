class MostsmallstrategiesController < ApplicationController
  # GET /mostsmallstrategies
  # GET /mostsmallstrategies.json
  def index
    @mostsmallstrategies = Mostsmallstrategy.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mostsmallstrategies }
    end
  end

  # GET /mostsmallstrategies/1
  # GET /mostsmallstrategies/1.json
  def show
    @mostsmallstrategy = Mostsmallstrategy.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mostsmallstrategy }
    end
  end

  # GET /mostsmallstrategies/new
  # GET /mostsmallstrategies/new.json
  def new
    @mostsmallstrategy = Mostsmallstrategy.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mostsmallstrategy }
    end
  end

  # GET /mostsmallstrategies/1/edit
  def edit
    @mostsmallstrategy = Mostsmallstrategy.find(params[:id])
  end

  # POST /mostsmallstrategies
  # POST /mostsmallstrategies.json
  def create
    @mostsmallstrategy = Mostsmallstrategy.new(params[:mostsmallstrategy])

    respond_to do |format|
      if @mostsmallstrategy.save
        format.html { redirect_to @mostsmallstrategy, notice: 'Mostsmallstrategy was successfully created.' }
        format.json { render json: @mostsmallstrategy, status: :created, location: @mostsmallstrategy }
      else
        format.html { render action: "new" }
        format.json { render json: @mostsmallstrategy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mostsmallstrategies/1
  # PUT /mostsmallstrategies/1.json
  def update
    @mostsmallstrategy = Mostsmallstrategy.find(params[:id])

    respond_to do |format|
      if @mostsmallstrategy.update_attributes(params[:mostsmallstrategy])
        format.html { redirect_to @mostsmallstrategy, notice: 'Mostsmallstrategy was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mostsmallstrategy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mostsmallstrategies/1
  # DELETE /mostsmallstrategies/1.json
  def destroy
    @mostsmallstrategy = Mostsmallstrategy.find(params[:id])
    @mostsmallstrategy.destroy

    respond_to do |format|
      format.html { redirect_to mostsmallstrategies_url }
      format.json { head :no_content }
    end
  end
end
