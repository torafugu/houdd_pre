class SmalltopsController < ApplicationController
  # GET /smalltops
  # GET /smalltops.json
  def index
    @smalltops = Smalltop.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @smalltops }
    end
  end

  # GET /smalltops/1
  # GET /smalltops/1.json
  def show
    @smalltop = Smalltop.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @smalltop }
    end
  end

  # GET /smalltops/new
  # GET /smalltops/new.json
  def new
    @smalltop = Smalltop.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @smalltop }
    end
  end

  # GET /smalltops/1/edit
  def edit
    @smalltop = Smalltop.find(params[:id])
  end

  # POST /smalltops
  # POST /smalltops.json
  def create
    @smalltop = Smalltop.new(params[:smalltop])

    respond_to do |format|
      if @smalltop.save
        format.html { redirect_to @smalltop, notice: 'Smalltop was successfully created.' }
        format.json { render json: @smalltop, status: :created, location: @smalltop }
      else
        format.html { render action: "new" }
        format.json { render json: @smalltop.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /smalltops/1
  # PUT /smalltops/1.json
  def update
    @smalltop = Smalltop.find(params[:id])

    respond_to do |format|
      if @smalltop.update_attributes(params[:smalltop])
        format.html { redirect_to @smalltop, notice: 'Smalltop was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @smalltop.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /smalltops/1
  # DELETE /smalltops/1.json
  def destroy
    @smalltop = Smalltop.find(params[:id])
    @smalltop.destroy

    respond_to do |format|
      format.html { redirect_to smalltops_url }
      format.json { head :no_content }
    end
  end

  # GET /smalltops/1/portal
  def portal
    @smalltop = Smalltop.find(params[:id])
    @smallmobunits = Smallmobunit.find_all_by_smalluser_id(@smalltop.smalluser.id)
    @smallmaps = Smallmap.find_all_by_smalluser_id(@smalltop.smalluser.id)
    render
  end
end
