Rails.application.routes.draw do

  get '/auth/google_oauth2/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get '/dashboard', to: 'user/dashboard#show'
  get '/near_by_stores', to: 'store_search#index', as: "store_search"
  get 'user/:id/profile', to: 'user/profile#show', as: "user_profile"

  resources :reviews
  resources :stores, only: [:index, :show]
  resources :sessions, only: [:create, :destroy]
  namespace :user do
    resources :tank
  end
  root to: 'home#show'
end
