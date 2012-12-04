class MosttinyturnsController < ApplicationController
  # GET /mosttinyturns
  # GET /mosttinyturns.json
  def index
    @mosttinyturns = Mosttinyturn.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mosttinyturns }
    end
  end

  # GET /mosttinyturns/1
  # GET /mosttinyturns/1.json
  def show
    @mosttinyturn = Mosttinyturn.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mosttinyturn }
    end
  end

  # GET /mosttinyturns/new
  # GET /mosttinyturns/new.json
  def new
    @mosttinyturn = Mosttinyturn.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mosttinyturn }
    end
  end

  # GET /mosttinyturns/1/edit
  def edit
    @mosttinyturn = Mosttinyturn.find(params[:id])
  end

  # POST /mosttinyturns
  # POST /mosttinyturns.json
  def create
    @mosttinyturn = Mosttinyturn.new(params[:mosttinyturn])

    respond_to do |format|
      if @mosttinyturn.save
        format.html { redirect_to @mosttinyturn, notice: 'Mosttinyturn was successfully created.' }
        format.json { render json: @mosttinyturn, status: :created, location: @mosttinyturn }
      else
        format.html { render action: "new" }
        format.json { render json: @mosttinyturn.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mosttinyturns/1
  # PUT /mosttinyturns/1.json
  def update
    @mosttinyturn = Mosttinyturn.find(params[:id])

    respond_to do |format|
      if @mosttinyturn.update_attributes(params[:mosttinyturn])
        format.html { redirect_to @mosttinyturn, notice: 'Mosttinyturn was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mosttinyturn.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mosttinyturns/1
  # DELETE /mosttinyturns/1.json
  def destroy
    @mosttinyturn = Mosttinyturn.find(params[:id])
    @mosttinyturn.destroy

    respond_to do |format|
      format.html { redirect_to mosttinyturns_url }
      format.json { head :no_content }
    end
  end
end
