# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @posts = Post.includes(:user).order id: :desc
    @recommended_users = User.all.sample 3
  end
end
