# frozen_string_literal: true

class PostsController < ApplicationController
  def show
    @post = Post.find params[:id]
    @replies = @post.replies.includes(:user).order id: :desc
    @new_reply = Post.new reply_to_id: params[:id], user_id: current_user.id
    @recommended_users = User.recommend
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new post_params
    @post.user = current_user
    @post.save!
  end

  private

  def post_params
    params.require(:post).permit :content, :user_id, :reply_to_id
  end
end
