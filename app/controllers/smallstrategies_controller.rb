class SmallstrategiesController < ApplicationController
  # GET /smallstrategies
  # GET /smallstrategies.json
  def index
    @smallstrategies = Smallstrategy.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @smallstrategies }
    end
  end

  # GET /smallstrategies/1
  # GET /smallstrategies/1.json
  def show
    @smallstrategy = Smallstrategy.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @smallstrategy }
    end
  end

  # GET /smallstrategies/new
  # GET /smallstrategies/new.json
  def new
    @smallstrategy = Smallstrategy.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @smallstrategy }
    end
  end

  # GET /smallstrategies/1/edit
  def edit
    @smallstrategy = Smallstrategy.find(params[:id])
  end

  # POST /smallstrategies
  # POST /smallstrategies.json
  def create
    @smallstrategy = Smallstrategy.new(params[:smallstrategy])

    respond_to do |format|
      if @smallstrategy.save
        format.html { redirect_to @smallstrategy, notice: 'Smallstrategy was successfully created.' }
        format.json { render json: @smallstrategy, status: :created, location: @smallstrategy }
      else
        format.html { render action: "new" }
        format.json { render json: @smallstrategy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /smallstrategies/1
  # PUT /smallstrategies/1.json
  def update
    @smallstrategy = Smallstrategy.find(params[:id])

    respond_to do |format|
      if @smallstrategy.update_attributes(params[:smallstrategy])
        format.html { redirect_to @smallstrategy, notice: 'Smallstrategy was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @smallstrategy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /smallstrategies/1
  # DELETE /smallstrategies/1.json
  def destroy
    @smallstrategy = Smallstrategy.find(params[:id])
    @smallstrategy.destroy

    respond_to do |format|
      format.html { redirect_to smallstrategies_url }
      format.json { head :no_content }
    end
  end
end
