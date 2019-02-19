# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit
  before_action :ensure_logged_in

  private

  def current_user
    return if session[:current_user_id].nil?

    session[:current_user_type].safe_constantize.find(session[:current_user_id])
  end

  def ensure_logged_in
    redirect_to root_url if session[:current_user_id].nil?
  end

  def login_user(user)
    session[:current_user_id] = user.id
    session[:current_user_type] = user.class.name
  end

  def logout_user
    session[:current_user_id] = session[:current_user_type] = nil
  end
end
