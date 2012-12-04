class MosttinymapsController < ApplicationController
  # GET /mosttinymaps
  # GET /mosttinymaps.json
  def index
    @mosttinymaps = Mosttinymap.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mosttinymaps }
    end
  end

  # GET /mosttinymaps/1
  # GET /mosttinymaps/1.json
  def show
    @mosttinymap = Mosttinymap.find(params[:id], :include => :mosttinyuser)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mosttinymap }
    end
  end

  # GET /mosttinymaps/new
  # GET /mosttinymaps/new.json
  def new
    @mosttinymap = Mosttinymap.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mosttinymap }
    end
  end

  # GET /mosttinymaps/1/edit
  def edit
    @mosttinymap = Mosttinymap.find(params[:id])
  end

  # POST /mosttinymaps
  # POST /mosttinymaps.json
  def create
    @mosttinymap = Mosttinymap.new(params[:mosttinymap])

    respond_to do |format|
      if @mosttinymap.save
        format.html { redirect_to @mosttinymap, notice: 'Mosttinymap was successfully created.' }
        format.json { render json: @mosttinymap, status: :created, location: @mosttinymap }
      else
        format.html { render action: "new" }
        format.json { render json: @mosttinymap.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mosttinymaps/1
  # PUT /mosttinymaps/1.json
  def update
    @mosttinymap = Mosttinymap.find(params[:id])

    respond_to do |format|
      if @mosttinymap.update_attributes(params[:mosttinymap])
        format.html { redirect_to @mosttinymap, notice: 'Mosttinymap was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mosttinymap.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mosttinymaps/1
  # DELETE /mosttinymaps/1.json
  def destroy
    @mosttinymap = Mosttinymap.find(params[:id])
    @mosttinymap.destroy

    respond_to do |format|
      format.html { redirect_to mosttinymaps_url }
      format.json { head :no_content }
    end
  end
end
