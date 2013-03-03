class MostsmallmobspeciesController < ApplicationController
  # GET /mostsmallmobspecies
  # GET /mostsmallmobspecies.json
  def index
    @mostsmallmobspecies = Mostsmallmobspecie.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mostsmallmobspecies }
    end
  end

  # GET /mostsmallmobspecies/1
  # GET /mostsmallmobspecies/1.json
  def show
    @mostsmallmobspecie = Mostsmallmobspecie.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mostsmallmobspecie }
    end
  end

  # GET /mostsmallmobspecies/new
  # GET /mostsmallmobspecies/new.json
  def new
    @mostsmallmobspecie = Mostsmallmobspecie.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mostsmallmobspecie }
    end
  end

  # GET /mostsmallmobspecies/1/edit
  def edit
    @mostsmallmobspecie = Mostsmallmobspecie.find(params[:id])
  end

  # POST /mostsmallmobspecies
  # POST /mostsmallmobspecies.json
  def create
    @mostsmallmobspecie = Mostsmallmobspecie.new(params[:mostsmallmobspecie])

    respond_to do |format|
      if @mostsmallmobspecie.save
        format.html { redirect_to @mostsmallmobspecie, notice: 'Mostsmallmobspecie was successfully created.' }
        format.json { render json: @mostsmallmobspecie, status: :created, location: @mostsmallmobspecie }
      else
        format.html { render action: "new" }
        format.json { render json: @mostsmallmobspecie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mostsmallmobspecies/1
  # PUT /mostsmallmobspecies/1.json
  def update
    @mostsmallmobspecie = Mostsmallmobspecie.find(params[:id])

    respond_to do |format|
      if @mostsmallmobspecie.update_attributes(params[:mostsmallmobspecie])
        format.html { redirect_to @mostsmallmobspecie, notice: 'Mostsmallmobspecie was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mostsmallmobspecie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mostsmallmobspecies/1
  # DELETE /mostsmallmobspecies/1.json
  def destroy
    @mostsmallmobspecie = Mostsmallmobspecie.find(params[:id])
    @mostsmallmobspecie.destroy

    respond_to do |format|
      format.html { redirect_to mostsmallmobspecies_url }
      format.json { head :no_content }
    end
  end
end
