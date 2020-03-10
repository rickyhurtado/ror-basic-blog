Rails.application.routes.draw do
  devise_for :users

  root to: 'home#index'
  resources :posts
  get 'blogs/:blog_id/posts', to: 'posts#by_blog', as: 'posts_by_blog'
end
