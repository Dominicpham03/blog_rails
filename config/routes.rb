Rails.application.routes.draw do
  namespace :api do
    resources :users do #user
      resources :posts, only: [:index]  #user post
    resources :posts  # Full  for posts
  end
end
