# frozen_string_literal: true

class ApplicantsController < ApplicationController
  # before_action :set_applicant, only: %i[show edit update destroy]
  skip_before_action :ensure_logged_in, only: %i[login new create]

  def login
    if request.method_symbol == :get
      @applicant = Applicant.new
    else
      @applicant = Applicant.find_by(email: applicant_params[:email]).try(:authenticate, applicant_params[:password])
      if @applicant
        login_user(@applicant)
        redirect_to job_openings_path
      else
        redirect_to action: 'login'
      end
    end
  end

  def index
    @applicants = Applicant.all
  end

  def new
    @applicant = Applicant.new
  end

  def create
    @applicant = Applicant.new(applicant_params)

    respond_to do |format|
      if @applicant.save
        login_user(@applicant)
        format.html { redirect_to job_openings_path, notice: 'Job seeker was successfully created.' }
        format.json { render :show, status: :created, location: @applicant }
      else
        format.html { render :new }
        format.json { render json: @applicant.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # def set_applicant
  #   @applicant = Applicant.find(params[:id])
  # end

  def applicant_params
    params.require(:applicant).permit(:name, :email, :password, :password_confirmation)
  end
end
