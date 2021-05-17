Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'main#index'
  resources :listings
  resources :bids

  get '/users/:user_id', to: 'users#show', as: 'show_user'
  post '/listings/:game_id', to: 'listings#create'
  post '/bids/:listing_id', to: 'bids#create'
  # get '/listings/:id', to: 'listings#index', as: 'listings'
  # get '/listings/:id/new', to: 'listings#new'
  # post '/listings/:id/new', to: 'listings#create'
end
