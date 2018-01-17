Myflix::Application.routes.draw do
  get 'ui(/:action)', controller: 'ui'

  root to: "pages#front"

  get  'home',             to: 'videos#index'
  get  '/register',        to: 'users#new'
  get  '/login',           to: 'sessions#new'
  post '/login',           to: 'sessions#create'
  get  '/logout',          to: 'sessions#destroy'
  get  '/my_queue',        to: 'queue_items#index'
  get  '/people',          to: 'relationships#index'
  get  '/forgot_password', to: 'forgot_passwords#new'
  get  '/forgot_password_confirmation', to: 'forgot_passwords#confirm'

  resources :forgot_passwords, only: [:create]
  resources :relationships, only: [:create, :destroy]
  resources :password_resets, only: [:show, :create] # chose :show because it expects an ID, which is user's token
  get 'expired_token', to: 'password_resets#expired_token'

  # below can't be in resources because we aren't updating a model,
  # but rather a collection of models:
  post 'update_queue', to: 'queue_items#update_queue'

  resources :queue_items, only: [:create, :destroy]
  resources :categories,  only: [:show]
  resources :session,     only: [:create]
  resources :users,       only: [:create, :show]
  resources :invitations, only: [:new, :create]

  resources :videos, only: [:index, :show] do
    collection do
      post :search, to: "videos#search"
    end
    resources :reviews, only: [:create]
  end
end
