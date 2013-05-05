class MediumResearchAllotmentsController < ApplicationController
  # GET /medium_research_allotments
  # GET /medium_research_allotments.json
  def index
    @medium_research_allotments = MediumResearchAllotment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @medium_research_allotments }
    end
  end

  # GET /medium_research_allotments/1
  # GET /medium_research_allotments/1.json
  def show
    @medium_research_allotment = MediumResearchAllotment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @medium_research_allotment }
    end
  end

  # GET /medium_research_allotments/new
  # GET /medium_research_allotments/new.json
  def new
    @medium_research_allotment = MediumResearchAllotment.new
    @research_symbols = MediumSymbolList.find_all_by_category_sym("RESEARCH").collect{|m| [m.description, m.id]}

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @medium_research_allotment }
    end
  end

  # GET /medium_research_allotments/1/edit
  def edit
    @medium_research_allotment = MediumResearchAllotment.find(params[:id])
  end

  # POST /medium_research_allotments
  # POST /medium_research_allotments.json
  def create
    @medium_research_allotment = MediumResearchAllotment.new(params[:medium_research_allotment])

    respond_to do |format|
      if @medium_research_allotment.save
        format.html { redirect_to @medium_research_allotment, notice: 'Medium research allotment was successfully created.' }
        format.json { render json: @medium_research_allotment, status: :created, location: @medium_research_allotment }
      else
        format.html { render action: "new" }
        format.json { render json: @medium_research_allotment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /medium_research_allotments/1
  # PUT /medium_research_allotments/1.json
  def update
    @medium_research_allotment = MediumResearchAllotment.find(params[:id])

    respond_to do |format|
      if @medium_research_allotment.update_attributes(params[:medium_research_allotment])
        format.html { redirect_to @medium_research_allotment, notice: 'Medium research allotment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @medium_research_allotment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /medium_research_allotments/1
  # DELETE /medium_research_allotments/1.json
  def destroy
    @medium_research_allotment = MediumResearchAllotment.find(params[:id])
    @medium_research_allotment.destroy

    respond_to do |format|
      format.html { redirect_to medium_research_allotments_url }
      format.json { head :no_content }
    end
  end
end
