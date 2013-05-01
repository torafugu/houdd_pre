class MediumMapCellsController < ApplicationController
  # GET /medium_map_cells
  # GET /medium_map_cells.json
  def index
    @medium_map_cells = MediumMapCell.find_all_by_medium_map_id(params[:map_id].to_i)
    @medium_map_id = params[:map_id]

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @medium_map_cells }
    end
  end

  # GET /medium_map_cells/1
  # GET /medium_map_cells/1.json
  def show
    @medium_map_cell = MediumMapCell.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @medium_map_cell }
    end
  end

  # GET /medium_map_cells/new
  # GET /medium_map_cells/new.json
  def new
    @medium_map_cell = MediumMapCell.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @medium_map_cell }
    end
  end

  # GET /medium_map_cells/1/edit
  def edit
    @medium_map_cell = MediumMapCell.find(params[:id])
  end

  # POST /medium_map_cells
  # POST /medium_map_cells.json
  def create
    @medium_map_cell = MediumMapCell.new(params[:medium_map_cell])

    respond_to do |format|
      if @medium_map_cell.save
        format.html { redirect_to @medium_map_cell, notice: 'Medium map cell was successfully created.' }
        format.json { render json: @medium_map_cell, status: :created, location: @medium_map_cell }
      else
        format.html { render action: "new" }
        format.json { render json: @medium_map_cell.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /medium_map_cells/1
  # PUT /medium_map_cells/1.json
  def update
    @medium_map_cell = MediumMapCell.find(params[:id])

    respond_to do |format|
      if @medium_map_cell.update_attributes(params[:medium_map_cell])
        format.html { redirect_to @medium_map_cell, notice: 'Medium map cell was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @medium_map_cell.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /medium_map_cells/1
  # DELETE /medium_map_cells/1.json
  def destroy
    @medium_map_cell = MediumMapCell.find(params[:id])
    @medium_map_cell.destroy

    respond_to do |format|
      format.html { redirect_to medium_map_cells_url }
      format.json { head :no_content }
    end
  end

  # GET /medium_map_cells/1/select_id
  def select_id
    medium_map_id = MediumMapCell.find(params[:id]).medium_map_id
    @medium_map_cell_id = MediumMapCell.find_by_medium_map_id_and_x_and_y(medium_map_id, params[:x].to_i, params[:y].to_i).id
  end
end
