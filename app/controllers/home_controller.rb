class HomeController < ApplicationController
  def index
    render locals: {
      posts: Post.all_public
    }
  end
end
