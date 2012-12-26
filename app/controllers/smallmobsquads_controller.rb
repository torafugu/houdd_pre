class SmallmobsquadsController < ApplicationController
  # GET /smallmobsquads
  # GET /smallmobsquads.json
  def index
    @smallmobsquads = Smallmobsquad.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @smallmobsquads }
    end
  end

  # GET /smallmobsquads/1
  # GET /smallmobsquads/1.json
  def show
    @smallmobsquad = Smallmobsquad.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @smallmobsquad }
    end
  end

  # GET /smallmobsquads/new
  # GET /smallmobsquads/new.json
  def new
    @smallmobsquad = Smallmobsquad.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @smallmobsquad }
    end
  end

  # GET /smallmobsquads/1/edit
  def edit
    @smallmobsquad = Smallmobsquad.find(params[:id])
  end

  # POST /smallmobsquads
  # POST /smallmobsquads.json
  def create
    @smallmobsquad = Smallmobsquad.new(params[:smallmobsquad])

    respond_to do |format|
      if @smallmobsquad.save
        format.html { redirect_to @smallmobsquad, notice: 'Smallmobsquad was successfully created.' }
        format.json { render json: @smallmobsquad, status: :created, location: @smallmobsquad }
      else
        format.html { render action: "new" }
        format.json { render json: @smallmobsquad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /smallmobsquads/1
  # PUT /smallmobsquads/1.json
  def update
    @smallmobsquad = Smallmobsquad.find(params[:id])

    respond_to do |format|
      if @smallmobsquad.update_attributes(params[:smallmobsquad])
        format.html { redirect_to @smallmobsquad, notice: 'Smallmobsquad was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @smallmobsquad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /smallmobsquads/1
  # DELETE /smallmobsquads/1.json
  def destroy
    @smallmobsquad = Smallmobsquad.find(params[:id])
    @smallmobsquad.destroy

    respond_to do |format|
      format.html { redirect_to smallmobsquads_url }
      format.json { head :no_content }
    end
  end

  # GET /smallmobsquad/select_mob_and_unit
  # GET /smallmobsquad/1/select_mob_and_unit
  def select_mob_and_unit
    @mob_data = Smallmob.find_all_by_smalluser_id(params[:user_id]).collect{|m| [m.name, m.id]}
    @selected_mob_data = Smallmobsquad.find_by_smalluser_id(params[:user_id]).mob_ids unless Smallmobsquad.find_by_smalluser_id(params[:user_id]).nil?
    @unit_data = Smallmobunit.find_all_by_smalluser_id(params[:user_id]).collect{|m| [m.name, m.id]}
    render
  end
end
