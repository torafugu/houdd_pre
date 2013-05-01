class MediumDungeonCellsController < ApplicationController
  # GET /medium_dungeon_cells
  # GET /medium_dungeon_cells.json
  def index
    @medium_dungeon_cells = MediumDungeonCell.find_all_by_medium_dungeon_id(params[:dungeon_id].to_i)
    @medium_dungeon_id = params[:dungeon_id]

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @medium_dungeon_cells }
    end
  end

  # GET /medium_dungeon_cells/1
  # GET /medium_dungeon_cells/1.json
  def show
    @medium_dungeon_cell = MediumDungeonCell.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @medium_dungeon_cell }
    end
  end

  # GET /medium_dungeon_cells/new
  # GET /medium_dungeon_cells/new.json
  def new
    @medium_dungeon_cell = MediumDungeonCell.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @medium_dungeon_cell }
    end
  end

  # GET /medium_dungeon_cells/1/edit
  def edit
    @medium_dungeon_cell = MediumDungeonCell.find(params[:id])
  end

  # POST /medium_dungeon_cells
  # POST /medium_dungeon_cells.json
  def create
    @medium_dungeon_cell = MediumDungeonCell.new(params[:medium_dungeon_cell])

    respond_to do |format|
      if @medium_dungeon_cell.save
        format.html { redirect_to @medium_dungeon_cell, notice: 'Medium dungeon cell was successfully created.' }
        format.json { render json: @medium_dungeon_cell, status: :created, location: @medium_dungeon_cell }
      else
        format.html { render action: "new" }
        format.json { render json: @medium_dungeon_cell.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /medium_dungeon_cells/1
  # PUT /medium_dungeon_cells/1.json
  def update
    @medium_dungeon_cell = MediumDungeonCell.find(params[:id])

    respond_to do |format|
      if @medium_dungeon_cell.update_attributes(params[:medium_dungeon_cell])
        format.html { redirect_to @medium_dungeon_cell, notice: 'Medium dungeon cell was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @medium_dungeon_cell.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /medium_dungeon_cells/1
  # DELETE /medium_dungeon_cells/1.json
  def destroy
    @medium_dungeon_cell = MediumDungeonCell.find(params[:id])
    @medium_dungeon_cell.destroy

    respond_to do |format|
      format.html { redirect_to medium_dungeon_cells_url }
      format.json { head :no_content }
    end
  end

  # GET /medium_dungeon_cells/1/select_id
  def select_id
    medium_dungeon_id = MediumDungeonCell.find(params[:id]).medium_dungeon_id
    @medium_dungeon_cell_id = MediumDungeonCell.find_by_medium_dungeon_id_and_x_and_y(medium_dungeon_id, params[:x].to_i, params[:y].to_i).id
  end
end
