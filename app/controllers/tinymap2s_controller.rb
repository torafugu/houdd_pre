class Tinymap2sController < ApplicationController
  # GET /tinymap2s
  # GET /tinymap2s.json
  def index
    @tinymap2s = Tinymap.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tinymap2s }
    end
  end

  # GET /tinymap2s/1
  # GET /tinymap2s/1.json
  def show
    @tinymap2 = Tinymap.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tinymap2 }
    end
  end
end
