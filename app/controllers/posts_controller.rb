class PostsController < ApplicationController
  def by_blog
    blog_id = params[:blog_id].to_i

    render locals: {
      posts: Post.all_public_posts_by_blog(blog_id),
      blog_name: Blog.find(blog_id).name
    }
  end

  def show
    render locals: {
      post: Post.find(params[:id])
    }
  end
end
