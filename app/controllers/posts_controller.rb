# frozen_string_literal: true

class PostsController < ApplicationController
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
