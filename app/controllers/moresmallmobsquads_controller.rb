class MoresmallmobsquadsController < ApplicationController
  # GET /moresmallmobsquads
  # GET /moresmallmobsquads.json
  def index
    @moresmallmobsquads = Moresmallmobsquad.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @moresmallmobsquads }
    end
  end

  # GET /moresmallmobsquads/1
  # GET /moresmallmobsquads/1.json
  def show
    @moresmallmobsquad = Moresmallmobsquad.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @moresmallmobsquad }
    end
  end

  # GET /moresmallmobsquads/new
  # GET /moresmallmobsquads/new.json
  def new
    @moresmallmobsquad = Moresmallmobsquad.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @moresmallmobsquad }
    end
  end

  # GET /moresmallmobsquads/1/edit
  def edit
    @moresmallmobsquad = Moresmallmobsquad.find(params[:id])
  end

  # POST /moresmallmobsquads
  # POST /moresmallmobsquads.json
  def create
    @moresmallmobsquad = Moresmallmobsquad.new(params[:moresmallmobsquad])

    respond_to do |format|
      if @moresmallmobsquad.save
        format.html { redirect_to @moresmallmobsquad, notice: 'Moresmallmobsquad was successfully created.' }
        format.json { render json: @moresmallmobsquad, status: :created, location: @moresmallmobsquad }
      else
        format.html { render action: "new" }
        format.json { render json: @moresmallmobsquad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /moresmallmobsquads/1
  # PUT /moresmallmobsquads/1.json
  def update
    @moresmallmobsquad = Moresmallmobsquad.find(params[:id])

    respond_to do |format|
      if @moresmallmobsquad.update_attributes(params[:moresmallmobsquad])
        format.html { redirect_to @moresmallmobsquad, notice: 'Moresmallmobsquad was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @moresmallmobsquad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /moresmallmobsquads/1
  # DELETE /moresmallmobsquads/1.json
  def destroy
    @moresmallmobsquad = Moresmallmobsquad.find(params[:id])
    @moresmallmobsquad.destroy

    respond_to do |format|
      format.html { redirect_to moresmallmobsquads_url }
      format.json { head :no_content }
    end
  end

  # GET /moresmallmobsquads/select_mob_and_unit
  # GET /moresmallmobsquads/1/select_mob_and_unit
  def select_mob_and_unit
    @mobs = Moresmallmob.find_all_by_moresmalluser_id(params[:user_id]).collect{|m| [m.name, m.id]}
    @selected_mob = Moresmallmobsquad.find(params[:id]).mob_ids unless Moresmallmobsquad.find_by_moresmalluser_id(params[:user_id]).nil?
    @units = Moresmallmobunit.find_all_by_moresmalluser_id(params[:user_id]).collect{|m| [m.name, m.id]}
    @units.unshift(["", 0])
    @selected_unit = Moresmallmobsquad.find(params[:id]).moresmallmobunit_id
    render
  end
end
