Rails.application.routes.draw do

  get '/auth/google_oauth2/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get '/dashboard', to: 'user/dashboard#show'
  get '/near_by_stores', to: 'store_search#index', as: "store_search"

  resources :stores, only: [:index, :show]
  resources :sessions, only: [:create, :destroy]

  root to: 'home#show'
end
