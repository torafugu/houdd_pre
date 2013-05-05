class MediumJobsController < ApplicationController
  # GET /medium_jobs
  # GET /medium_jobs.json
  def index
    @medium_jobs = MediumJob.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @medium_jobs }
    end
  end

  # GET /medium_jobs/1
  # GET /medium_jobs/1.json
  def show
    @medium_job = MediumJob.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @medium_job }
    end
  end

  # GET /medium_jobs/new
  # GET /medium_jobs/new.json
  def new
    @medium_job = MediumJob.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @medium_job }
    end
  end

  # GET /medium_jobs/1/edit
  def edit
    @medium_job = MediumJob.find(params[:id])
  end

  # POST /medium_jobs
  # POST /medium_jobs.json
  def create
    @medium_job = MediumJob.new(params[:medium_job])

    respond_to do |format|
      if @medium_job.save
        format.html { redirect_to @medium_job, notice: 'Medium job was successfully created.' }
        format.json { render json: @medium_job, status: :created, location: @medium_job }
      else
        format.html { render action: "new" }
        format.json { render json: @medium_job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /medium_jobs/1
  # PUT /medium_jobs/1.json
  def update
    @medium_job = MediumJob.find(params[:id])

    respond_to do |format|
      if @medium_job.update_attributes(params[:medium_job])
        format.html { redirect_to @medium_job, notice: 'Medium job was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @medium_job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /medium_jobs/1
  # DELETE /medium_jobs/1.json
  def destroy
    @medium_job = MediumJob.find(params[:id])
    @medium_job.destroy

    respond_to do |format|
      format.html { redirect_to medium_jobs_url }
      format.json { head :no_content }
    end
  end
end
