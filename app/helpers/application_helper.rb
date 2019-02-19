# frozen_string_literal: true

module ApplicationHelper
  def user_is_applicant?
    session[:current_user_type] == 'Applicant'
  end

  def user_is_employer?
    session[:current_user_type] == 'Employer'
  end
end
