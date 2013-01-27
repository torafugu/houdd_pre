class MoresmallmobunitsController < ApplicationController
  # GET /moresmallmobunits
  # GET /moresmallmobunits.json
  def index
    @moresmallmobunits = Moresmallmobunit.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @moresmallmobunits }
    end
  end

  # GET /moresmallmobunits/1
  # GET /moresmallmobunits/1.json
  def show
    @moresmallmobunit = Moresmallmobunit.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @moresmallmobunit }
    end
  end

  # GET /moresmallmobunits/new
  # GET /moresmallmobunits/new.json
  def new
    @moresmallmobunit = Moresmallmobunit.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @moresmallmobunit }
    end
  end

  # GET /moresmallmobunits/1/edit
  def edit
    @moresmallmobunit = Moresmallmobunit.find(params[:id])
  end

  # POST /moresmallmobunits
  # POST /moresmallmobunits.json
  def create
    @moresmallmobunit = Moresmallmobunit.new(params[:moresmallmobunit])

    respond_to do |format|
      if @moresmallmobunit.save
        format.html { redirect_to @moresmallmobunit, notice: 'Moresmallmobunit was successfully created.' }
        format.json { render json: @moresmallmobunit, status: :created, location: @moresmallmobunit }
      else
        format.html { render action: "new" }
        format.json { render json: @moresmallmobunit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /moresmallmobunits/1
  # PUT /moresmallmobunits/1.json
  def update
    @moresmallmobunit = Moresmallmobunit.find(params[:id])

    respond_to do |format|
      if @moresmallmobunit.update_attributes(params[:moresmallmobunit])
        format.html { redirect_to @moresmallmobunit, notice: 'Moresmallmobunit was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @moresmallmobunit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /moresmallmobunits/1
  # DELETE /moresmallmobunits/1.json
  def destroy
    @moresmallmobunit = Moresmallmobunit.find(params[:id])
    @moresmallmobunit.destroy

    respond_to do |format|
      format.html { redirect_to moresmallmobunits_url }
      format.json { head :no_content }
    end
  end

  # GET /moresmallmobunits/select_squad
  # GET /moresmallmobunits/1/select_squad
  def select_squad
    @squad_data = Moresmallmobsquad.find_all_by_moresmalluser_id(params[:user_id]).collect{|m| [m.name, m.id]}
    @selected_squad_data = Moresmallmobunit.find(params[:id]).squad_ids unless Moresmallmobunit.find(params[:id]).nil?
    render
  end

  # GET /moresmallmobunits/select_cur_map
  # GET /moresmallmobunits/1/select_cur_map
  def select_cur_map
    @map_data = Moresmallmap.find_all_by_moresmalluser_id(params[:user_id]).collect{|m| [m.name, m.id]}
    render
  end
end
