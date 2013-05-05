class MediumSkillExpInvsController < ApplicationController
  # GET /medium_skill_exp_invs
  # GET /medium_skill_exp_invs.json
  def index
    @medium_skill_exp_invs = MediumSkillExpInv.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @medium_skill_exp_invs }
    end
  end

  # GET /medium_skill_exp_invs/1
  # GET /medium_skill_exp_invs/1.json
  def show
    @medium_skill_exp_inv = MediumSkillExpInv.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @medium_skill_exp_inv }
    end
  end

  # GET /medium_skill_exp_invs/new
  # GET /medium_skill_exp_invs/new.json
  def new
    @medium_skill_exp_inv = MediumSkillExpInv.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @medium_skill_exp_inv }
    end
  end

  # GET /medium_skill_exp_invs/1/edit
  def edit
    @medium_skill_exp_inv = MediumSkillExpInv.find(params[:id])
  end

  # POST /medium_skill_exp_invs
  # POST /medium_skill_exp_invs.json
  def create
    @medium_skill_exp_inv = MediumSkillExpInv.new(params[:medium_skill_exp_inv])

    respond_to do |format|
      if @medium_skill_exp_inv.save
        format.html { redirect_to @medium_skill_exp_inv, notice: 'Medium skill exp inv was successfully created.' }
        format.json { render json: @medium_skill_exp_inv, status: :created, location: @medium_skill_exp_inv }
      else
        format.html { render action: "new" }
        format.json { render json: @medium_skill_exp_inv.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /medium_skill_exp_invs/1
  # PUT /medium_skill_exp_invs/1.json
  def update
    @medium_skill_exp_inv = MediumSkillExpInv.find(params[:id])

    respond_to do |format|
      if @medium_skill_exp_inv.update_attributes(params[:medium_skill_exp_inv])
        format.html { redirect_to @medium_skill_exp_inv, notice: 'Medium skill exp inv was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @medium_skill_exp_inv.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /medium_skill_exp_invs/1
  # DELETE /medium_skill_exp_invs/1.json
  def destroy
    @medium_skill_exp_inv = MediumSkillExpInv.find(params[:id])
    @medium_skill_exp_inv.destroy

    respond_to do |format|
      format.html { redirect_to medium_skill_exp_invs_url }
      format.json { head :no_content }
    end
  end
end
