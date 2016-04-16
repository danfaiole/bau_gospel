Rails.application.routes.draw do
  get 'session/new'

  get 'session/create'

  get 'session/destroy'

  get 'session/login'
  get 'session/logout'
  get 'home/index'

  resources :posts
  resources :users do
    get :confirmation_email, on: :member
  end

  root 'home#index'
end
