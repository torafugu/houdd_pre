class MediumSkillsController < ApplicationController
  # GET /medium_skills
  # GET /medium_skills.json
  def index
    @medium_skills = MediumSkill.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @medium_skills }
    end
  end

  # GET /medium_skills/1
  # GET /medium_skills/1.json
  def show
    @medium_skill = MediumSkill.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @medium_skill }
    end
  end

  # GET /medium_skills/new
  # GET /medium_skills/new.json
  def new
    @medium_skill = MediumSkill.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @medium_skill }
    end
  end

  # GET /medium_skills/1/edit
  def edit
    @medium_skill = MediumSkill.find(params[:id])
  end

  # POST /medium_skills
  # POST /medium_skills.json
  def create
    @medium_skill = MediumSkill.new(params[:medium_skill])

    respond_to do |format|
      if @medium_skill.save
        format.html { redirect_to @medium_skill, notice: 'Medium skill was successfully created.' }
        format.json { render json: @medium_skill, status: :created, location: @medium_skill }
      else
        format.html { render action: "new" }
        format.json { render json: @medium_skill.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /medium_skills/1
  # PUT /medium_skills/1.json
  def update
    @medium_skill = MediumSkill.find(params[:id])

    respond_to do |format|
      if @medium_skill.update_attributes(params[:medium_skill])
        format.html { redirect_to @medium_skill, notice: 'Medium skill was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @medium_skill.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /medium_skills/1
  # DELETE /medium_skills/1.json
  def destroy
    @medium_skill = MediumSkill.find(params[:id])
    @medium_skill.destroy

    respond_to do |format|
      format.html { redirect_to medium_skills_url }
      format.json { head :no_content }
    end
  end
end
