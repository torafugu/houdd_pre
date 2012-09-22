class TinymapsController < ApplicationController
  # GET /tinymaps
  # GET /tinymaps.json
  def index
    @tinymaps = Tinymap.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tinymaps }
    end
  end

  # GET /tinymaps/1
  # GET /tinymaps/1.json
  def show
    @tinymap = Tinymap.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tinymap }
    end
  end

  # GET /tinymaps/new
  # GET /tinymaps/new.json
  def new
    @tinymap = Tinymap.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tinymap }
    end
  end

  # GET /tinymaps/1/edit
  def edit
    @tinymap = Tinymap.find(params[:id])
  end

  # POST /tinymaps
  # POST /tinymaps.json
  def create
    @tinymap = Tinymap.new(params[:tinymap])

    respond_to do |format|
      if @tinymap.save
        format.html { redirect_to @tinymap, notice: 'Tinymap was successfully created.' }
        format.json { render json: @tinymap, status: :created, location: @tinymap }
      else
        format.html { render action: "new" }
        format.json { render json: @tinymap.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tinymaps/1
  # PUT /tinymaps/1.json
  def update
    @tinymap = Tinymap.find(params[:id])

    respond_to do |format|
      if @tinymap.update_attributes(params[:tinymap])
        format.html { redirect_to @tinymap, notice: 'Tinymap was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tinymap.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tinymaps/1
  # DELETE /tinymaps/1.json
  def destroy
    @tinymap = Tinymap.find(params[:id])
    @tinymap.destroy

    respond_to do |format|
      format.html { redirect_to tinymaps_url }
      format.json { head :no_content }
    end
  end
end
