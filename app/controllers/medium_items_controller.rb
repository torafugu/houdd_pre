class MediumItemsController < ApplicationController
  # GET /medium_items
  # GET /medium_items.json
  def index
    @medium_items = MediumItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @medium_items }
    end
  end

  # GET /medium_items/1
  # GET /medium_items/1.json
  def show
    @medium_item = MediumItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @medium_item }
    end
  end

  # GET /medium_items/new
  # GET /medium_items/new.json
  def new
    @medium_item = MediumItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @medium_item }
    end
  end

  # GET /medium_items/1/edit
  def edit
    @medium_item = MediumItem.find(params[:id])
  end

  # POST /medium_items
  # POST /medium_items.json
  def create
    @medium_item = MediumItem.new(params[:medium_item])

    respond_to do |format|
      if @medium_item.save
        format.html { redirect_to @medium_item, notice: 'Medium item was successfully created.' }
        format.json { render json: @medium_item, status: :created, location: @medium_item }
      else
        format.html { render action: "new" }
        format.json { render json: @medium_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /medium_items/1
  # PUT /medium_items/1.json
  def update
    @medium_item = MediumItem.find(params[:id])

    respond_to do |format|
      if @medium_item.update_attributes(params[:medium_item])
        format.html { redirect_to @medium_item, notice: 'Medium item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @medium_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /medium_items/1
  # DELETE /medium_items/1.json
  def destroy
    @medium_item = MediumItem.find(params[:id])
    @medium_item.destroy

    respond_to do |format|
      format.html { redirect_to medium_items_url }
      format.json { head :no_content }
    end
  end
end
