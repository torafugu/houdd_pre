class MediumGenesController < ApplicationController
  # GET /medium_genes
  # GET /medium_genes.json
  def index
    @medium_genes = MediumGene.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @medium_genes }
    end
  end

  # GET /medium_genes/1
  # GET /medium_genes/1.json
  def show
    @medium_gene = MediumGene.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @medium_gene }
    end
  end

  # GET /medium_genes/new
  # GET /medium_genes/new.json
  def new
    @medium_gene = MediumGene.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @medium_gene }
    end
  end

  # GET /medium_genes/1/edit
  def edit
    @medium_gene = MediumGene.find(params[:id])
  end

  # POST /medium_genes
  # POST /medium_genes.json
  def create
    @medium_gene = MediumGene.new(params[:medium_gene])

    respond_to do |format|
      if @medium_gene.save
        format.html { redirect_to @medium_gene, notice: 'Medium gene was successfully created.' }
        format.json { render json: @medium_gene, status: :created, location: @medium_gene }
      else
        format.html { render action: "new" }
        format.json { render json: @medium_gene.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /medium_genes/1
  # PUT /medium_genes/1.json
  def update
    @medium_gene = MediumGene.find(params[:id])

    respond_to do |format|
      if @medium_gene.update_attributes(params[:medium_gene])
        format.html { redirect_to @medium_gene, notice: 'Medium gene was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @medium_gene.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /medium_genes/1
  # DELETE /medium_genes/1.json
  def destroy
    @medium_gene = MediumGene.find(params[:id])
    @medium_gene.destroy

    respond_to do |format|
      format.html { redirect_to medium_genes_url }
      format.json { head :no_content }
    end
  end
end
