Rails.application.routes.draw do
  resources :posts
  resources :users
  get 'home/index'

  root 'home#index'
end
