Rails.application.routes.draw do

  get '/auth/google_oauth2/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :stores, only: [:index, :show]
  resources :sessions, only: [:create, :destroy]

  root to: 'home#show'
end
