class MediumSymbolListsController < ApplicationController
  # GET /medium_symbol_lists
  # GET /medium_symbol_lists.json
  def index
    @medium_symbol_lists = MediumSymbolList.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @medium_symbol_lists }
    end
  end

  # GET /medium_symbol_lists/1
  # GET /medium_symbol_lists/1.json
  def show
    @medium_symbol_list = MediumSymbolList.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @medium_symbol_list }
    end
  end

  # GET /medium_symbol_lists/new
  # GET /medium_symbol_lists/new.json
  def new
    @medium_symbol_list = MediumSymbolList.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @medium_symbol_list }
    end
  end

  # GET /medium_symbol_lists/1/edit
  def edit
    @medium_symbol_list = MediumSymbolList.find(params[:id])
  end

  # POST /medium_symbol_lists
  # POST /medium_symbol_lists.json
  def create
    @medium_symbol_list = MediumSymbolList.new(params[:medium_symbol_list])

    respond_to do |format|
      if @medium_symbol_list.save
        format.html { redirect_to @medium_symbol_list, notice: 'Medium symbol list was successfully created.' }
        format.json { render json: @medium_symbol_list, status: :created, location: @medium_symbol_list }
      else
        format.html { render action: "new" }
        format.json { render json: @medium_symbol_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /medium_symbol_lists/1
  # PUT /medium_symbol_lists/1.json
  def update
    @medium_symbol_list = MediumSymbolList.find(params[:id])

    respond_to do |format|
      if @medium_symbol_list.update_attributes(params[:medium_symbol_list])
        format.html { redirect_to @medium_symbol_list, notice: 'Medium symbol list was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @medium_symbol_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /medium_symbol_lists/1
  # DELETE /medium_symbol_lists/1.json
  def destroy
    @medium_symbol_list = MediumSymbolList.find(params[:id])
    @medium_symbol_list.destroy

    respond_to do |format|
      format.html { redirect_to medium_symbol_lists_url }
      format.json { head :no_content }
    end
  end
end
