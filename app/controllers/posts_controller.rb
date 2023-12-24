# frozen_string_literal: true

class PostsController < ApplicationController
  def show
    @post = Post.find params[:id]
    @replies = @post.replies.includes(:user).order id: :desc
    @recommended_users = User.recommend
  end

  def new
    @post = Post.new user_id: current_user.id
  end

  def create
    @post = Post.new post_params
    @post.user_id = current_user.id
    @post.save!
  end

  private

  def post_params
    params.require(:post).permit :content, :user_id
  end
end
