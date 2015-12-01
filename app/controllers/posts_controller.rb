class PostsController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
    post = Post.new(post_params[:post])
    if post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  private

  def post_params
    params.permit(post:[:body])
  end
end
