class MoretinymapsController < ApplicationController
  # GET /moretinymaps
  # GET /moretinymaps.json
  def index
    @moretinymaps = Moretinymap.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @moretinymaps }
    end
  end

  # GET /moretinymaps/1
  # GET /moretinymaps/1.json
  def show

    @moretinymap = Moretinymap.find(params[:id])

    @guardmobs = Moretinymob.find_all_by_moretinymap_id_and_is_guard(params[:id], true, :include => :moretinymobinfo)
    @intrudermobs = Moretinymob.find_all_by_moretinymap_id_and_is_guard(params[:id], false, :include => :moretinymobinfo)

    @intrudermobtrail = Moretinymobtrail.first(:include => :moretinymob, :conditions => ["moretinymobs.is_guard = ?", false])

    @mobbattles = Moretinymobbattle.all

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @moretinymap }
    end
  end

  # GET /moretinymaps/new
  # GET /moretinymaps/new.json
  def new
    @moretinymap = Moretinymap.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @moretinymap }
    end
  end

  # GET /moretinymaps/1/edit
  def edit
    @moretinymap = Moretinymap.find(params[:id])
  end

  # POST /moretinymaps
  # POST /moretinymaps.json
  def create
    @moretinymap = Moretinymap.new(params[:moretinymap])

    respond_to do |format|
      if @moretinymap.save
        format.html { redirect_to @moretinymap, notice: 'Moretinymap was successfully created.' }
        format.json { render json: @moretinymap, status: :created, location: @moretinymap }
      else
        format.html { render action: "new" }
        format.json { render json: @moretinymap.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /moretinymaps/1
  # PUT /moretinymaps/1.json
  def update
    @moretinymap = Moretinymap.find(params[:id])

    respond_to do |format|
      if @moretinymap.update_attributes(params[:moretinymap])
        format.html { redirect_to @moretinymap, notice: 'Moretinymap was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @moretinymap.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /moretinymaps/1
  # DELETE /moretinymaps/1.json
  def destroy
    @moretinymap = Moretinymap.find(params[:id])
    @moretinymap.destroy

    respond_to do |format|
      format.html { redirect_to moretinymaps_url }
      format.json { head :no_content }
    end
  end
end
