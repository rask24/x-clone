# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :redirect_if_not_logged_in
  before_action :redirect_logged_in

  private

  def redirect_logged_in
    return unless user_signed_in?
    return unless request.path == root_path

    redirect_to home_index_path
  end

  def redirect_if_not_logged_in
    return if user_signed_in? || is_allowed_path
    redirect_to root_path
  end

  def is_allowed_path
    request.path == root_path || request.path == new_user_registration_path ||
      request.path == new_user_session_path
  end
end
