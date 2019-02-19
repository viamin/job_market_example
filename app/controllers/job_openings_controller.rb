# frozen_string_literal: true

class JobOpeningsController < ApplicationController
  before_action :set_job_opening, only: %i[show edit update destroy apply]

  # PUT /job_openings/1/apply
  def apply
    if @job_opening.can_apply?(current_user)
      JobApplication.create(job_opening: @job_opening, applicant: current_user)
      notice = "You've successfully applied to this job"
    else
      notice = "You can't apply to that job opening"
    end
    redirect_to @job_opening, notice: notice
  end

  # GET /job_openings
  # GET /job_openings.json
  def index
    @job_openings = JobOpening.all
    @current_user = current_user
  end

  # GET /job_openings/1
  # GET /job_openings/1.json
  def show
    @current_user = current_user
  end

  # GET /job_openings/new
  def new
    @job_opening = JobOpening.new
  end

  # GET /job_openings/1/edit
  def edit; end

  # POST /job_openings
  # POST /job_openings.json
  def create
    @job_opening = JobOpening.new(job_opening_params.merge(employer: current_user))

    respond_to do |format|
      if @job_opening.save
        format.html { redirect_to @job_opening, notice: 'Job opening was successfully created.' }
        format.json { render :show, status: :created, location: @job_opening }
      else
        format.html { render :new }
        format.json { render json: @job_opening.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /job_openings/1
  # PATCH/PUT /job_openings/1.json
  def update
    respond_to do |format|
      if @job_opening.update(job_opening_params)
        format.html { redirect_to @job_opening, notice: 'Job opening was successfully updated.' }
        format.json { render :show, status: :ok, location: @job_opening }
      else
        format.html { render :edit }
        format.json { render json: @job_opening.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /job_openings/1
  # DELETE /job_openings/1.json
  def destroy
    @job_opening.destroy
    respond_to do |format|
      format.html { redirect_to job_openings_url, notice: 'Job opening was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_job_opening
    @job_opening = JobOpening.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def job_opening_params
    params.require(:job_opening).permit(:title, :description)
  end
end
