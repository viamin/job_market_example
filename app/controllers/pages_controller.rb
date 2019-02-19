# frozen_string_literal: true

class PagesController < ApplicationController
  skip_before_action :ensure_logged_in

  def main; end
end
