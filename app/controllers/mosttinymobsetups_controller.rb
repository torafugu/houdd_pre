class MosttinymobsetupsController < ApplicationController
  # GET /mosttinymobsetups
  # GET /mosttinymobsetups.json
  def index
    @mosttinymobsetups = Mosttinymobsetup.all(:include => [:mosttinytrial, {:mosttinymob => :mosttinymobinfo}])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mosttinymobsetups }
    end
  end

  # GET /mosttinymobsetups/1
  # GET /mosttinymobsetups/1.json
  def show
    @mosttinymobsetup = Mosttinymobsetup.find(params[:id], :include => [:mosttinytrial, {:mosttinymob => :mosttinymobinfo}])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mosttinymobsetup }
    end
  end

  # GET /mosttinymobsetups/new
  # GET /mosttinymobsetups/new.json
  def new
    @mosttinymobsetup = Mosttinymobsetup.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mosttinymobsetup }
    end
  end

  # GET /mosttinymobsetups/1/edit
  def edit
    @mosttinymobsetup = Mosttinymobsetup.find(params[:id])
  end

  # POST /mosttinymobsetups
  # POST /mosttinymobsetups.json
  def create
    @mosttinymobsetup = Mosttinymobsetup.new(params[:mosttinymobsetup])

    respond_to do |format|
      if @mosttinymobsetup.save
        format.html { redirect_to @mosttinymobsetup, notice: 'Mosttinymobsetup was successfully created.' }
        format.json { render json: @mosttinymobsetup, status: :created, location: @mosttinymobsetup }
      else
        format.html { render action: "new" }
        format.json { render json: @mosttinymobsetup.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mosttinymobsetups/1
  # PUT /mosttinymobsetups/1.json
  def update
    @mosttinymobsetup = Mosttinymobsetup.find(params[:id])

    respond_to do |format|
      if @mosttinymobsetup.update_attributes(params[:mosttinymobsetup])
        format.html { redirect_to @mosttinymobsetup, notice: 'Mosttinymobsetup was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mosttinymobsetup.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mosttinymobsetups/1
  # DELETE /mosttinymobsetups/1.json
  def destroy
    @mosttinymobsetup = Mosttinymobsetup.find(params[:id])
    @mosttinymobsetup.destroy

    respond_to do |format|
      format.html { redirect_to mosttinymobsetups_url }
      format.json { head :no_content }
    end
  end
end
