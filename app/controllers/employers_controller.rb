# frozen_string_literal: true

class EmployersController < ApplicationController
  before_action :set_employer, only: %i[show]
  skip_before_action :ensure_logged_in, only: %i[login new create]

  def login
    if request.method_symbol == :get
      @employer = Employer.new
    else
      @employer = Employer.find_by(email: employer_params[:email]).try(:authenticate, employer_params[:password])
      if @employer
        login_user(@employer)
        redirect_to @employer
      else
        redirect_to action: 'login'
      end
    end
  end

  def index
    @employers = Employer.all
  end

  def show; end

  def new
    @employer = Employer.new
  end

  def create
    @employer = Employer.new(employer_params)

    respond_to do |format|
      if @employer.save
        login_user(@employer)

        format.html { redirect_to @employer, notice: 'Employer was successfully created.' }
        format.json { render :show, status: :created, location: @employer }
      else
        format.html { render :new }
        format.json { render json: @employer.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_employer
    @employer = Employer.find(params[:id])
  end

  def employer_params
    params.require(:employer).permit(:name, :email, :password, :password_confirmation)
  end
end
