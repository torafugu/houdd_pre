class SmallmobunitsController < ApplicationController
  # GET /smallmobunits
  # GET /smallmobunits.json
  def index
    @smallmobunits = Smallmobunit.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @smallmobunits }
    end
  end

  # GET /smallmobunits/1
  # GET /smallmobunits/1.json
  def show
    @smallmobunit = Smallmobunit.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @smallmobunit }
    end
  end

  # GET /smallmobunits/new
  # GET /smallmobunits/new.json
  def new
    @smallmobunit = Smallmobunit.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @smallmobunit }
    end
  end

  # GET /smallmobunits/1/edit
  def edit
    @smallmobunit = Smallmobunit.find(params[:id])
  end

  # POST /smallmobunits
  # POST /smallmobunits.json
  def create
    @smallmobunit = Smallmobunit.new(params[:smallmobunit])

    respond_to do |format|
      if @smallmobunit.save
        format.html { redirect_to @smallmobunit, notice: 'Smallmobunit was successfully created.' }
        format.json { render json: @smallmobunit, status: :created, location: @smallmobunit }
      else
        format.html { render action: "new" }
        format.json { render json: @smallmobunit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /smallmobunits/1
  # PUT /smallmobunits/1.json
  def update
    @smallmobunit = Smallmobunit.find(params[:id])

    respond_to do |format|
      if @smallmobunit.update_attributes(params[:smallmobunit])
        format.html { redirect_to @smallmobunit, notice: 'Smallmobunit was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @smallmobunit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /smallmobunits/1
  # DELETE /smallmobunits/1.json
  def destroy
    @smallmobunit = Smallmobunit.find(params[:id])
    @smallmobunit.destroy

    respond_to do |format|
      format.html { redirect_to smallmobunits_url }
      format.json { head :no_content }
    end
  end

  # GET /smallmobunits/select_squad
  # GET /smallmobunits/1/select_squad
  def select_squad
    @squad_data = Smallmobsquad.find_all_by_smalluser_id(params[:user_id]).collect{|m| [m.name, m.id]}
    @selected_squad_data = Smallmobunit.find_by_smalluser_id(params[:user_id]).squad_ids unless Smallmobunit.find_by_smalluser_id(params[:user_id]).nil?
    render
  end

  # GET /smallmobunits/select_map
  # GET /smallmobunits/1/select_map
  def select_map
    if params[:is_guard] == "true"
      @map_data = Smallmap.find_all_by_smalluser_id(params[:user_id]).collect{|m| [m.name, m.id]}
    else
      @map_data = Smallmap.all.collect{|m| [m.name, m.id]}
    end
    render
  end
end
