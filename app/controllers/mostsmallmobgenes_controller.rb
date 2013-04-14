class MostsmallmobgenesController < ApplicationController
  # GET /mostsmallmobgenes
  # GET /mostsmallmobgenes.json
  def index
    @mostsmallmobgenes = Mostsmallmobgene.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mostsmallmobgenes }
    end
  end

  # GET /mostsmallmobgenes/1
  # GET /mostsmallmobgenes/1.json
  def show
    @mostsmallmobgene = Mostsmallmobgene.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mostsmallmobgene }
    end
  end

  # GET /mostsmallmobgenes/new
  # GET /mostsmallmobgenes/new.json
  def new
    @mostsmallmobgene = Mostsmallmobgene.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mostsmallmobgene }
    end
  end

  # GET /mostsmallmobgenes/1/edit
  def edit
    @mostsmallmobgene = Mostsmallmobgene.find(params[:id])
  end

  # POST /mostsmallmobgenes
  # POST /mostsmallmobgenes.json
  def create
    @mostsmallmobgene = Mostsmallmobgene.new(params[:mostsmallmobgene])

    respond_to do |format|
      if @mostsmallmobgene.save
        format.html { redirect_to @mostsmallmobgene, notice: 'Mostsmallmobgene was successfully created.' }
        format.json { render json: @mostsmallmobgene, status: :created, location: @mostsmallmobgene }
      else
        format.html { render action: "new" }
        format.json { render json: @mostsmallmobgene.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mostsmallmobgenes/1
  # PUT /mostsmallmobgenes/1.json
  def update
    @mostsmallmobgene = Mostsmallmobgene.find(params[:id])

    respond_to do |format|
      if @mostsmallmobgene.update_attributes(params[:mostsmallmobgene])
        format.html { redirect_to @mostsmallmobgene, notice: 'Mostsmallmobgene was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mostsmallmobgene.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mostsmallmobgenes/1
  # DELETE /mostsmallmobgenes/1.json
  def destroy
    @mostsmallmobgene = Mostsmallmobgene.find(params[:id])
    @mostsmallmobgene.destroy

    respond_to do |format|
      format.html { redirect_to mostsmallmobgenes_url }
      format.json { head :no_content }
    end
  end

  # GET /mostsmallmobgenes/set_default_value
  def set_default_value
    @mostsmallmobgene = Mostsmallmobgenecreator.create(params[:mobspecie_id], params[:mothergene_id], params[:fathergene_id])
  end
end
