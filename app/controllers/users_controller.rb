# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    @user = User.find_by name: params[:name]
    @posts = @user.posts
  end
end
