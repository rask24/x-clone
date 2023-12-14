# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :redirect_if_not_logged_in

  private

  def redirect_if_not_logged_in
    return if user_signed_in? || is_allowed_path
    redirect_to root_path
  end

  def is_allowed_path
    request.path == root_path || request.path == new_user_registration_path ||
      request.path == new_user_session_path
  end
end
