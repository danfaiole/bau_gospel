Rails.application.routes.draw do
  get 'login', to: 'session#new', as: 'login'
  get 'logout', to: 'session#destroy', as: 'logout'
  get 'signup', to: 'users#new', as: 'signup'
  get 'home/index'

  resources :session, only: [:new, :create, :destroy]
  resources :posts
  resources :users do
    get :confirmation_email, on: :member
  end

  root 'home#index'
end
