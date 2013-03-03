class MostsmallsquadsController < ApplicationController
  # GET /mostsmallsquads
  # GET /mostsmallsquads.json
  def index
    @mostsmallsquads = Mostsmallsquad.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mostsmallsquads }
    end
  end

  # GET /mostsmallsquads/1
  # GET /mostsmallsquads/1.json
  def show
    @mostsmallsquad = Mostsmallsquad.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mostsmallsquad }
    end
  end

  # GET /mostsmallsquads/new
  # GET /mostsmallsquads/new.json
  def new
    @mostsmallsquad = Mostsmallsquad.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mostsmallsquad }
    end
  end

  # GET /mostsmallsquads/1/edit
  def edit
    @mostsmallsquad = Mostsmallsquad.find(params[:id])
  end

  # POST /mostsmallsquads
  # POST /mostsmallsquads.json
  def create
    @mostsmallsquad = Mostsmallsquad.new(params[:mostsmallsquad])

    respond_to do |format|
      if @mostsmallsquad.save
        format.html { redirect_to @mostsmallsquad, notice: 'Mostsmallsquad was successfully created.' }
        format.json { render json: @mostsmallsquad, status: :created, location: @mostsmallsquad }
      else
        format.html { render action: "new" }
        format.json { render json: @mostsmallsquad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mostsmallsquads/1
  # PUT /mostsmallsquads/1.json
  def update
    @mostsmallsquad = Mostsmallsquad.find(params[:id])

    respond_to do |format|
      if @mostsmallsquad.update_attributes(params[:mostsmallsquad])
        format.html { redirect_to @mostsmallsquad, notice: 'Mostsmallsquad was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mostsmallsquad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mostsmallsquads/1
  # DELETE /mostsmallsquads/1.json
  def destroy
    @mostsmallsquad = Mostsmallsquad.find(params[:id])
    @mostsmallsquad.destroy

    respond_to do |format|
      format.html { redirect_to mostsmallsquads_url }
      format.json { head :no_content }
    end
  end
end
