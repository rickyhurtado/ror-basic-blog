class PostsController < ApplicationController
  def show
    render locals: {
      post: Post.find(params[:id])
    }
  end
end
