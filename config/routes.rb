Rails.application.routes.draw do
  resources :posts
  resources :users do
    get :confirmation_email, on: :member
  end
  get 'home/index'

  root 'home#index'
end
