Rails.application.routes.draw do

  get '/auth/google_oauth2/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'session#destroy', as: 'signout'

  resources :stores, only: [:index]
  resources :sessions, only: [:create, :destroy]

  root to: 'home#dashboard'
end
