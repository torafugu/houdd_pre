class MoresmalltopsController < ApplicationController
  # GET /moresmalltops
  # GET /moresmalltops.json
  def index
    @moresmalltops = Moresmalltop.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @moresmalltops }
    end
  end

  # GET /moresmalltops/1
  # GET /moresmalltops/1.json
  def show
    @moresmalltop = Moresmalltop.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @moresmalltop }
    end
  end

  # GET /moresmalltops/new
  # GET /moresmalltops/new.json
  def new
    @moresmalltop = Moresmalltop.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @moresmalltop }
    end
  end

  # GET /moresmalltops/1/edit
  def edit
    @moresmalltop = Moresmalltop.find(params[:id])
  end

  # POST /moresmalltops
  # POST /moresmalltops.json
  def create
    @moresmalltop = Moresmalltop.new(params[:moresmalltop])

    respond_to do |format|
      if @moresmalltop.save
        format.html { redirect_to @moresmalltop, notice: 'Moresmalltop was successfully created.' }
        format.json { render json: @moresmalltop, status: :created, location: @moresmalltop }
      else
        format.html { render action: "new" }
        format.json { render json: @moresmalltop.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /moresmalltops/1
  # PUT /moresmalltops/1.json
  def update
    @moresmalltop = Moresmalltop.find(params[:id])

    respond_to do |format|
      if @moresmalltop.update_attributes(params[:moresmalltop])
        format.html { redirect_to @moresmalltop, notice: 'Moresmalltop was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @moresmalltop.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /moresmalltops/1
  # DELETE /moresmalltops/1.json
  def destroy
    @moresmalltop = Moresmalltop.find(params[:id])
    @moresmalltop.destroy

    respond_to do |format|
      format.html { redirect_to moresmalltops_url }
      format.json { head :no_content }
    end
  end

  # GET /moresmalltops/1/portal
  def portal
    @moresmalltop = Moresmalltop.find(params[:id])
    @units = Moresmallmobunit.find_all_by_moresmalluser_id(@moresmalltop.moresmalluser.id)
    @maps = Moresmallmap.find_all_by_moresmalluser_id(@moresmalltop.moresmalluser.id)
    render
  end
end
