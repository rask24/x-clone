# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :redirect_if_not_logged_in

  private

  def redirect_if_not_logged_in
    redirect_to root_path unless user_signed_in? || request.path == root_path
  end
end
