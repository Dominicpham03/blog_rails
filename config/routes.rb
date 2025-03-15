Rails.application.routes.draw do
  namespace :api do
    resources :users do # user
      resources :posts, only: [:index]  # user posts
    end
    resources :posts  # full access for posts
  end
end
