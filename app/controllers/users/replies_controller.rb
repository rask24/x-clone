# frozen_string_literal: true

module Users
  class RepliesController < ApplicationController
    def index
      @user = User.find_by name: params[:user_name]
      @posts = @user.posts.where.not(reply_to_id: nil).order id: :desc
    end
  end
end
