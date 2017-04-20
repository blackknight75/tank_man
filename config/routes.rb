Rails.application.routes.draw do

  get '/auth/google_oauth2/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get '/dashboard/:id', to: 'user/dashboard#show', as: "dashboard"
  get '/near_by_stores', to: 'store_search#index', as: "store_search"
  get 'user/:id/profile', to: 'user/profile#show', as: "user_profile"

  resources :reviews
  resources :stores, only: [:index, :show]
  resources :sessions, only: [:create, :destroy]
  namespace :user do
    resources :tanks do
      resources :fish
      resources :water_parameters, only: [:create]
    end
  end
  root to: 'home#show'
end
